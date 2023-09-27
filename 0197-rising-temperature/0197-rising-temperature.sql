/* Write your T-SQL query statement below */
SELECT W1.id
FROM Weather W1, Weather W2
WHERE DATEADD(day, -1, W1.recordDate) = W2.recordDate
AND W1.temperature > W2.temperature
