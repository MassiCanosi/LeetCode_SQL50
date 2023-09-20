/* Write your T-SQL query statement below */
SELECT 
CASE 
    WHEN id %2 = 0 THEN LAG(id,1) OVER(ORDER BY id ASC)
    WHEN id %2 <> 0 THEN ISNULL(LEAD(id,1) OVER(ORDER BY id ASC),id)
    END AS id
, student
FROM Seat
ORDER BY 1