/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
e.name AS name
, b.bonus AS bonus
FROM Employee e 
LEFT JOIN Bonus b 
    on e.empId = b.empId
) 
SELECT * FROM CTE WHERE CTE.bonus < 1000 or CTE.bonus IS NULL