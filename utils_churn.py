from __future__ import annotations
from typing import Optional, Dict, Any, Tuple
import pandas as pd
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import (
    accuracy_score, precision_score, recall_score, f1_score,
    roc_auc_score, classification_report
)
import numpy as np

def load_and_clean(path: str, drop_cols: Optional[list]=None) -> pd.DataFrame:
    df = pd.read_csv(path)
    if drop_cols:
        df = df.drop(columns=[c for c in drop_cols if c in df.columns])
    df = df.drop_duplicates()
    df = df.dropna()
    return df

def split_xy(df: pd.DataFrame, target: str) -> Tuple[pd.DataFrame, pd.Series]:
    assert target in df.columns, f"找不到目標欄位 {target}"
    y = df[target]
    X = df.drop(columns=[target])
    return X, y

def make_preprocessor(X: pd.DataFrame) -> ColumnTransformer:
    num_cols = X.select_dtypes(include=["number"]).columns.tolist()
    cat_cols = [c for c in X.columns if c not in num_cols]
    return ColumnTransformer(
        transformers=[
            ("cat", OneHotEncoder(handle_unknown="ignore"), cat_cols),
            ("num", "passthrough", num_cols),
        ]
    )

def train_and_eval(
    X: pd.DataFrame, y: pd.Series,
    model: str="logreg", test_size: float=0.2, random_state: int=42,
    tune: bool=False, n_iter: int=10
) -> Dict[str, Any]:
    """
    一行完成：切分資料 → 前處理 → 訓練 → 評估。
    model 可選 "logreg" 或 "rf"。
    tune=True 時會自動跑 RandomizedSearchCV。
    """

    # Step 1: Yes/No → 1/0
    if y.dtype == "object":
        if set(y.unique()) == {"Yes","No"}:
            y = y.map({"Yes":1,"No":0})

    pre = make_preprocessor(X)

    if model == "logreg":
        clf = LogisticRegression(max_iter=1000, class_weight="balanced")
        param_dist = {
            "clf__C": np.logspace(-3, 2, 10),
            "clf__solver": ["liblinear","lbfgs"],
        }
    elif model == "rf":
        clf = RandomForestClassifier(random_state=random_state)
        param_dist = {
            "clf__n_estimators": [100,200,300,400,500],
            "clf__max_depth": [None,5,10,20,30],
            "clf__min_samples_split": [2,5,10],
        }
    else:
        raise ValueError("model must be 'logreg' or 'rf'")

    pipe = Pipeline(steps=[("pre", pre), ("clf", clf)])

    Xtr, Xte, ytr, yte = train_test_split(
        X, y, stratify=y, test_size=test_size, random_state=random_state
    )

    # Step 2: 若 tune=True → RandomizedSearchCV
    if tune:
        search = RandomizedSearchCV(
            pipe, param_distributions=param_dist,
            n_iter=n_iter, cv=3, scoring="f1", n_jobs=-1, random_state=random_state
        )
        search.fit(Xtr, ytr)
        pipe = search.best_estimator_
        print("最佳參數:", search.best_params_)
    else:
        pipe.fit(Xtr, ytr)

    # Step 3: 評估
    yhat = pipe.predict(Xte)
    metrics = {
        "accuracy": accuracy_score(yte, yhat),
        "precision": precision_score(yte, yhat, zero_division=0),
        "recall": recall_score(yte, yhat, zero_division=0),
        "f1": f1_score(yte, yhat, zero_division=0),
    }
    try:
        proba = pipe.predict_proba(Xte)[:, 1]
        metrics["roc_auc"] = roc_auc_score(yte, proba)
    except Exception:
        pass
    metrics["report"] = classification_report(yte, yhat, digits=4, zero_division=0)

    return {"model": pipe, "metrics": metrics}

