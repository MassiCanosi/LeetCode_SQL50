/* Write your T-SQL query statement below */
SELECT c.name
FROM Customer c
WHERE c.referee_id <> 2 or c.referee_id IS NULL;