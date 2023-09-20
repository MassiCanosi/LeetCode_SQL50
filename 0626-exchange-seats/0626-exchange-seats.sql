/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
CASE 
    WHEN id %2 = 0 THEN LAG(id,1) OVER(ORDER BY id ASC)
    WHEN id %2 <> 0 THEN LEAD(id,1) OVER(ORDER BY id ASC) 
    END AS id
, student
FROM Seat
)
SELECT 
CASE WHEN CTE.id IS NULL THEN s.id ELSE CTE.id END AS id
, CTE.student
FROM CTE
JOIN Seat s 
    on CTE.student = s.student
ORDER BY 1