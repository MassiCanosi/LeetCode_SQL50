/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
CASE WHEN COUNT(num) = 1 THEN num ELSE NULL END as num
FROM MyNumbers
GROUP BY num
)
SELECT MAX(num) as num
FROM CTE
