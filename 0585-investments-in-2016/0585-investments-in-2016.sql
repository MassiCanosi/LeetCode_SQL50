WITH CTE AS (
  SELECT 
  tiv_2015 
  , tiv_2016 
  , COUNT(tiv_2015) OVER(PARTITION BY tiv_2015) as cnt
  , COUNT(CONCAT(lat,lon)) OVER(PARTITION BY CONCAT(lat,lon)) as cnt_place
  FROM Insurance
)
select 
ROUND(SUM(tiv_2016),2) as tiv_2016
from CTE
WHERE 
CTE.cnt > 1
AND CTE.cnt_place = 1

