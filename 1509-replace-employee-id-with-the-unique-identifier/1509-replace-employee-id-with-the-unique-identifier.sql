/* Write your T-SQL query statement below */
SELECT EU.unique_id , e.name
FROM Employees E
LEFT JOIN EmployeeUNI EU
    ON E.id = EU.id
