/* Write your T-SQL query statement below */
SELECT TOP 1 person_name FROM (
  SELECT 
  Queue.*
  , SUM(weight) OVER(ORDER BY turn) as run_tot
  FROM Queue 
) a
WHERE a.run_tot <= 1000
ORDER BY a.turn DESC