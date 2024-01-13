/* Write your T-SQL query statement below */
SELECT 
R.contest_id
, ROUND(100 * (COUNT(*) * 1.0 / ((SELECT COUNT(DISTINCT user_id) FROM Users) *1.0)),2) AS [percentage]
FROM Users U
JOIN Register R 
    ON U.user_id = R.user_id
GROUP BY 
contest_id
ORDER BY 
[percentage] DESC, R.contest_id ASC