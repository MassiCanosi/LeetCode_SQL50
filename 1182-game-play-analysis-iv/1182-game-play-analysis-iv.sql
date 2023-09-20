/* Write your T-SQL query statement below */
WITH CTE AS(
  SELECT
  player_id
  , event_date as first 
  , LEAD(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date ASC) as second
  , DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rk
  FROM Activity
)
SELECT 
ROUND(CAST(COUNT(DISTINCT CASE WHEN DATEDIFF(DAY, CTE.first,CTE.second) = 1 THEN CTE.player_id END) AS DECIMAL) / CAST(COUNT(DISTINCT CTE.player_id) AS DECIMAL),2) as fraction
FROM CTE
WHERE CTE.rk = 1