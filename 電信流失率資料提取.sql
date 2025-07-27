select count(*) as 總人數
from 電信客戶流失;

select count(case when 性別 ='Male' then 1 end) as 男性總人數, 
count(case when 性別 ='Female' then 1 end) as 女性總人數,
round
(1.0*count(case when 性別 ='Male' then 1 end)/count(*), 4) as 男性比例,
round
(1.0*count(case when 性別 ='Female' then 1 end)/count(*), 4) as 女性比例
from 電信客戶流失;

select count(case when 是否為高齡客戶 = 1 then 1 end) as 高齡客戶總人數,
count(case when 是否為高齡客戶 = 0 then 1 end) as 非高齡客戶總人數,
round
(1.0*count(case when 是否為高齡客戶 = 1 then 1 end) /count(*), 4) as 高齡客戶比例,
round
(1.0*count(case when 是否為高齡客戶 = 0 then 1 end)/count(*), 4) as 非高齡客戶比例
from 電信客戶流失;

SELECT 
    是否為高齡客戶,
    COUNT(CASE WHEN 是否流失 = 'Yes' THEN 1 END) AS 流失人數,
    COUNT(*) AS 總人數,
    ROUND(
        1.0 * COUNT(CASE WHEN 是否流失 = 'Yes' THEN 1 END) / COUNT(*), 4
    ) AS 流失率
FROM 電信客戶流失
GROUP BY 是否為高齡客戶;

select
是否有電話服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round(
1.0*count(case when 是否流失 = 'yes' then 1 end)/count(*), 4
) as 流失率
from 電信客戶流失
group by 是否有電話服務;


select 
是否有多條電話線,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
group by 是否有多條電話線;

select 
網路服務類型,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
group by 網路服務類型;

select 
是否有線上安全防護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有線上安全防護服務 IN ('Yes', 'No')
group by 是否有線上安全防護服務;

select 
是否有線上備份服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有線上備份服務 In ('Yes', 'No')
group by 是否有線上備份服務;

select 
是否有設備保護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有設備保護服務 In ('Yes', 'No')
group by 是否有設備保護服務;

select 
是否有技術支援服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有技術支援服務 in ('Yes', 'No')
group by 是否有技術支援服務;

select 
是否有串流電視服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有串流電視服務 in ('Yes', 'No')
group by 是否有串流電視服務;

select 
是否有串流電影服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 電信客戶流失
where 是否有串流電影服務 in ('Yes', 'No')
group by 是否有串流電影服務;

SELECT DISTINCT
  PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY 每月費用) OVER () AS 三分位1,
  PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY 每月費用) OVER () AS 三分位2
FROM 電信客戶流失;

SELECT DISTINCT
  PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY 總計費用) OVER () AS 三分位1,
  PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY 總計費用) OVER () AS 三分位2
FROM 電信客戶流失;


with 月費分類 as 
(
select 每月費用, 是否流失,
case when 
每月費用 < 50 then '低月費' 
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型, 
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數, 
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 月費分類
group by 月費類型
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;
 
 with 總費用分類 as 
(
select 總計費用, 是否流失,
case when 
總計費用 < 700 then '低總費' 
when 總計費用 between 700 and 2700 then '中總費'
else '高總費'
end as 總費用類型
from 電信客戶流失
)

select 總費用類型, 
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數, 
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 總費用分類
group by 總費用類型
order by 
case 總費用類型
when '低總費' then 1
when '中總費' then 2
when '高總費' then 3
end;

select [合約期間（月數）],
  count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
  count(*) as 總人數,
  round(1.0 * count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4) as 流失率
from 電信客戶流失
group by [合約期間（月數）]
order by [合約期間（月數）];

with 合約期間 as 
(
select [合約期間（月數）], 是否流失,
case when 
[合約期間（月數）] < 20 then '新用戶' 
when [合約期間（月數）] between 20 and 40 then '初期用戶'
when [合約期間（月數）] between 41 and 60 then '中期用戶'
else '長期用戶'
end as 合約期分類
from 電信客戶流失
)

select 合約期分類, 
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數, 
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 合約期間
group by 合約期分類
order by 
case 合約期分類
when '新用戶' then 1
when '初期用戶' then 2
when '中期用戶' then 3
when '長期用戶' then 4
end;

select 付款方式,
  count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
  count(*) as 總人數,
  round(1.0 * count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4) as 流失率
from 電信客戶流失
group by 付款方式
order by 付款方式;

select 是否使用電子帳單,
  count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
  count(*) as 總人數,
  round(1.0 * count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4) as 流失率
from 電信客戶流失
group by 是否使用電子帳單;


select 合約類型,
  count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
  count(*) as 總人數,
  round(1.0 * count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4) as 流失率
from 電信客戶流失
group by 合約類型;

with 服務總數 as 
(
select 客戶編號, 是否流失,
(
case when 是否有線上安全防護服務 = 'Yes' then 1 else 0 end +
case when 是否有線上備份服務 = 'Yes' then 1 else 0 end +
case when 是否有設備保護服務 = 'Yes' then 1 else 0 end +
case when 是否有技術支援服務 = 'Yes' then 1 else 0 end +
case when 是否有串流電視服務 = 'Yes' then 1 else 0 end +
case when 是否有串流電影服務 = 'Yes' then 1 else 0 end
)
as 網路服務數量
from 電信客戶流失
)

select 網路服務數量,
count(case when 是否流失 ='Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4)
as 流失率
from 服務總數
group by 網路服務數量
order by 網路服務數量;


select 性別,是否有線上安全防護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有線上安全防護服務 in ('Yes', 'No')
group by 性別, 是否有線上安全防護服務;

select 性別,是否有線上備份服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有線上備份服務 in ('Yes', 'No')
group by 性別, 是否有線上備份服務;

select 性別,是否有設備保護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有設備保護服務 in ('Yes', 'No')
group by 性別, 是否有設備保護服務;

select 性別,是否有技術支援服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有技術支援服務 in ('Yes', 'No')
group by 性別, 是否有技術支援服務;

select 性別,是否有串流電視服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有串流電視服務 in ('Yes', 'No')
group by 性別, 是否有串流電視服務;

select 性別,是否有串流電影服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有串流電影服務 in ('Yes', 'No')
group by 性別, 是否有串流電影服務; 


select 是否為高齡客戶, 是否有線上安全防護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有線上安全防護服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有線上安全防護服務;


select 是否為高齡客戶,是否有線上備份服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有線上備份服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有線上備份服務;

select 是否為高齡客戶,是否有設備保護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有設備保護服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有設備保護服務;

select 是否為高齡客戶,是否有技術支援服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有技術支援服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有技術支援服務;

select 是否為高齡客戶,是否有串流電視服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有串流電視服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有串流電視服務;

select 是否為高齡客戶,是否有串流電影服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end) / count(*), 4
)as 流失率
from 電信客戶流失
where 是否有串流電影服務 in ('Yes', 'No')
group by 是否為高齡客戶, 是否有串流電影服務;

with 月費費用 as (
select 每月費用,是否有線上安全防護服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有線上安全防護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有線上安全防護服務 in ('Yes', 'No')
group by 月費類型, 是否有線上安全防護服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費費用 as (
select 每月費用,是否有線上備份服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有線上備份服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有線上備份服務 in ('Yes', 'No')
group by 月費類型, 是否有線上備份服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費費用 as (
select 每月費用,是否有設備保護服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有設備保護服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有設備保護服務 in ('Yes', 'No')
group by 月費類型, 是否有設備保護服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費費用 as (
select 每月費用,是否有技術支援服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有技術支援服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有技術支援服務 in ('Yes', 'No')
group by 月費類型, 是否有技術支援服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費費用 as (
select 每月費用,是否有串流電視服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有串流電視服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有串流電視服務 in ('Yes', 'No')
group by 月費類型, 是否有串流電視服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費費用 as (
select 每月費用,是否有串流電影服務,是否流失,
case when 每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,是否有串流電影服務,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費費用
where 是否有串流電影服務 in ('Yes', 'No')
group by 月費類型, 是否有串流電影服務
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

with 月費分類 as (
select 每月費用, 合約類型, 是否流失,
case when
每月費用 < 50 then '低月費'
when 每月費用 between 50 and 85 then '中月費'
else '高月費'
end as 月費類型
from 電信客戶流失
)

select 月費類型,合約類型,
count(case when 是否流失 ='Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0*count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 月費分類
group by 月費類型, 合約類型
order by 
case 月費類型
when '低月費' then 1
when '中月費' then 2
when '高月費' then 3
end;

select 是否為高齡客戶, 是否使用電子帳單,
count(case when 是否流失 = 'Yes' then 1 end) as 流失人數,
count(*) as 總人數,
round
(1.0* count(case when 是否流失 = 'Yes' then 1 end)/count(*), 4) as 流失率
from 電信客戶流失
group by 是否為高齡客戶, 是否使用電子帳單;

SELECT 
    COUNT(CASE WHEN 是否流失 = 'Yes' THEN 1 END) AS 流失人數,
    count(case when 是否流失 = 'No' then 1 end) as 非流失人數,
    COUNT(*) AS 總人數,
    ROUND(
        1.0 * COUNT(CASE WHEN 是否流失 = 'Yes' THEN 1 END) / COUNT(*), 4
    ) AS 流失率
FROM 電信客戶流失;
