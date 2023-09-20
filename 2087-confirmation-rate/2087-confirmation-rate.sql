/* Write your T-SQL query statement below */
WITH TAB AS (
  SELECT DISTINCT
  user_id
  , sum(case when action = 'confirmed' then 1 else 0 end) as confirmed
  , count(user_id) as total
  FROM Confirmations 
  GROUP BY 
  user_id
)
SELECT 
S.user_id
, ISNULL(ROUND(CAST(T.confirmed AS DECIMAL)/CAST(T.total AS DECIMAL),2),0) AS confirmation_rate
FROM Signups s
LEFT JOIN TAB T
  ON T.user_id = S.user_id