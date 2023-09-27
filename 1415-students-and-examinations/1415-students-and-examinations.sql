/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT DISTINCT 
    s.student_id 
    , s.student_name 
    , su.subject_name 
    FROM Students s, Subjects su
)
SELECT 
CTE.student_id
, CTE.student_name
, CTE.subject_name
, COUNT(e.subject_name) AS attended_exams
FROM CTE
LEFT JOIN Examinations e 
    ON CTE.student_id = e.student_id
    AND CTE.subject_name = e.subject_name
GROUP BY 
CTE.student_id
, CTE.student_name
, CTE.subject_name
ORDER BY 1,2