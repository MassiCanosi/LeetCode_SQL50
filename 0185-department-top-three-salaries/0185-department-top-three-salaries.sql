/* Write your T-SQL query statement below */
WITH CTE AS ( 
    SELECT 
    D.name AS Department 
    , E.name AS Employee 
    , E.salary AS Salary 
    , DENSE_RANK() OVER(PARTITION BY D.name ORDER BY E.salary DESC) DRK 
    FROM Employee E 
    JOIN Department D 
        ON E.departmentId = D.id 
    ) 
    SELECT 
    CTE.Department 
    , CTE.Employee 
    , CTE.Salary 
    FROM CTE 
    WHERE CTE.DRK IN (1,2,3) 
    ORDER BY 2 DESC