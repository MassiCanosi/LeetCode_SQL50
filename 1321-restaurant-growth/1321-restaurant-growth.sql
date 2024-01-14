WITH CTE AS (
  SELECT DISTINCT 
  visited_on
  , SUM(amount) as total
  FROM Customer
  GROUP BY 
  visited_on 
)

SELECT 
TEMP.visited_on 
, TEMP.amount
, TEMP.average_amount
FROM(
  SELECT DISTINCT
  CTE.visited_on
  , SUM(CTE.total) OVER (ORDER BY CTE.visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
  , ROUND(AVG(CAST(CTE.total AS FLOAT)) OVER (ORDER BY CTE.visited_on ROWS    BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
  FROM CTE
) TEMP
WHERE 
DATEADD(DAY, -6, TEMP.visited_on) IN (SELECT CTE.visited_on FROM CTE)
ORDER BY 1 ASC


