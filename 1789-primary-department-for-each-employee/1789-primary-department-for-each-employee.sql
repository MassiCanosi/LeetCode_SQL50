/* Write your T-SQL query statement below */
SELECT 
employee_id
, department_id
FROM Employee
WHERE
(
    primary_flag = 'Y' 
    OR 
    employee_id IN (
        SELECT employee_id
        FROM Employee
        GROUP BY 
        employee_id
        HAVING COUNT(employee_id) = 1
        )
)

--**************************
-- OR 

--WITH CTE AS (
--SELECT 
--employee_id
--, COUNT(employee_id) as freq
--FROM Employee
--GROUP BY 
--employee_id
--), CTE1 AS (
--SELECT 
--E.Employee_id
--, CASE 
--    WHEN CTE.freq = 1 THEN E.department_id 
--    WHEN CTE.freq > 1 AND E.primary_flag = 'Y' THEN E.department_id 
--    END AS department_id
-- FROM Employee E 
-- JOIN CTE 
--    ON E.employee_id = CTE.employee_id
--)
--SELECT * FROM CTE1 
--WHERE 
--department_id IS NOT NULL