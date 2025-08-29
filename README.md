# 📉 電信客戶流失分析（SQL + Power BI）

## 🧾 專案簡介
本專案針對電信業客戶資料，透過 SQL 撈取與整理關鍵變數，並以 Power BI 建立互動式儀表板，全面分析影響流失率的各項因素。最終提出策略建議以協助降低客戶流失率。

## 📊 報表展示（PDF）
👉 [點我查看完整報表 PDF](電信客戶流失分析報告.pdf)

## 🔎 建模補充
除了報表與 SQL，本專案亦運用Python進行機器學習建模，評估不同模型對客戶流失預測的表現。 

本專案同時提供：
- **Notebook**：完整的分析過程與可視化
- **工具包 (`utils_churn.py`)**：模組化工具，方便團隊快速重現與擴展分析流程

- [📂 建模補充報告 PDF](./電信客戶流失分析建模補充.pdf)  
- [💻 Jupyter Notebook](./python建模.ipynb)

## 📁 檔案內容
| 檔名 | 說明 |
|------|------|
| `SQLQuery3.sql` | 撈取分析所需變數的 SQL 查詢 |
| `完成品.pdf` | Power BI 匯出報表，包含 KPI 與所有視覺化圖表 |

## 🔍 分析內容

透過 SQL 撈取資料後，使用 Power BI 對以下變數與流失率的關係進行交叉分析：

- 高齡與否 vs 流失率
- 各項服務（如網路、電話等）vs 流失率
- 月費高低 vs 流失率
- 簽約月份數 vs 流失率
- 付款方式 vs 流失率
- 是否使用電子帳單 vs 流失率
- 合約類型 vs 流失率
- 使用總服務數 vs 流失率
- 性別 * 各項服務 vs 流失率
- 高齡 * 各項服務 vs 流失率
- 月份 * 各項服務 vs 流失率
- 月費 * 合約類型 vs 流失率
- 高齡 * 是否使用電子帳單 vs 流失率

## 📈 儀表板內容（Power BI）

- 🎯 **KPI 字卡**
  - 高月費流失率
  - 總體流失率
  - 月租流失率
  - 高齡者流失率

- 📊 **圖表視覺化**
  - 群組直條圖：顯示各種變數與流失率之關係
  - 折線圖：合約月數 vs 流失率（可調整月份範圍）
  - 儀表板分區：高/中/低月費層級

## 💡 專案重點與洞察

本分析完整涵蓋**客戶輪廓、使用行為、帳單偏好與方案選擇**等面向，透過視覺化快速發現：
- 高齡者流失率明顯偏高
- 採用月租型方案的客戶流失率較高
- 使用電子帳單與電子支付的客戶流失率偏高
- 特定服務與月費之組合會明顯提高流失風險

## 🧠 策略建議

- 高齡者可透過服務配置有效降低流失率
- 多與月租型方案客戶溝通，嘗試使其轉為穩定型客戶
- 優化電子帳單與電子支付使用體驗與溝通
- 重新審視月費與服務的配置，以有效降低中月費與高月費的流失率

---

## 🧰 工具包使用方法

本專案除了完整的 Notebook 分析外，額外提供 `utils_churn.py`，
模擬團隊協作時可重複使用的工具函式，讓他人能快速重現分析流程。

### 安裝需求
```bash
pip install -r requirements.txt
```

### 使用範例
```
from utils_churn import load_and_clean, split_xy, train_and_eval

# 讀取與清理
df = load_and_clean("telco_churn_with_all_feedback.csv")
X, y = split_xy(df, "Churn")

# Baseline 模型
res = train_and_eval(X, y, model="rf")
print(res["metrics"])

# 自動調參（RandomizedSearchCV）
res = train_and_eval(X, y, model="rf", tune=True, n_iter=20)
print(res["metrics"])

```

### 範例輸出
```
最佳參數: {'clf__n_estimators': 500, 'clf__min_samples_split': 2, 'clf__max_depth': None}
{'accuracy': 0.7977, 'precision': 0.678, 'recall': 0.454, 'f1': 0.544, 'roc_auc': 0.845, ...}

```

## 附件
🔧 工具包 [./utils_stock.py](./utils_stock.py) 

-🔎[使用範例](./test.ipynb)   
---

## 🙋‍♂️ 作者說明

本作品為個人練習與求職作品，所有資料為模擬資料，目的在於展示數據分析與視覺化呈現能力。
**警告：本專案資料與分析結果僅供學習參考，切勿用於任何實務策略或商業決策。**



