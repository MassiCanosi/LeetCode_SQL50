/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
requester_id as id
, accept_date
FROM RequestAccepted
UNION ALL 
SELECT 
accepter_id as id
, accept_date
FROM RequestAccepted
)
SELECT 
id 
, COUNT(id) as num
FROM CTE 
GROUP BY id
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY