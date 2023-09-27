/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT
    a.machine_id
    , a.process_id
    , a.timestamp AS [start] 
    FROM Activity a
    WHERE a.activity_type = 'start'
) 
SELECT 
CTE.machine_id
, ROUND(AVG(TEMP.[end] - CTE.[start]),3) AS processing_time
FROM (
    SELECT
    a.machine_id
    , a.process_id
    , a.timestamp AS [end]      
    FROM Activity a
    WHERE a.activity_type = 'end'
) TEMP
JOIN CTE 
    ON TEMP.machine_id = CTE.machine_id
    AND TEMP.process_id = CTE.process_id
GROUP BY 
CTE.machine_id