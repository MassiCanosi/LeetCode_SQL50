/* Write your T-SQL query statement below */
WITH CTE AS (
  SELECT * FROM (
    SELECT 
    person_id
    , person_name
    , weight
    , turn
    , SUM(weight) OVER(ORDER BY turn ASC) otp
    FROM Queue
    GROUP BY 
    person_id
    , person_name
    , turn
    , weight
  ) v
  WHERE v.otp <= 1000
), CTE1 AS (
  SELECT 
  CTE.*
  , ROW_NUMBER() OVER (ORDER BY CTE.turn DESC) RN
  FROM CTE
)
SELECT 
CTE1.person_name
FROM CTE1
WHERE CTE1.RN=1 
