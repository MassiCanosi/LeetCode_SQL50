/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
num
, LEAD(num, 1) OVER(ORDER BY id) as next 
, LEAD(num, 2) OVER(ORDER BY id) as following 
FROM Logs
), CTE1 AS (
SELECT distinct
CASE WHEN CTE.num = CTE.next and CTE.next = CTE.following THEN CTE.num END AS ConsecutiveNums
FROM CTE 
)
SELECT * FROM CTE1 WHERE CTE1.ConsecutiveNums IS NOT NULL