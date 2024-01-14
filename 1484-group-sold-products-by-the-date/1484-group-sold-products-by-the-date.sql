/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT DISTINCT sell_date, product FROM Activities
)
SELECT DISTINCT
CTE.sell_date
, COUNT(CTE.product) AS num_sold
, STRING_AGG(CTE.product,',') WITHIN GROUP (ORDER BY CTE.product ASC) AS products
FROM CTE
GROUP BY 
CTE.sell_date
ORDER BY 1 ASC