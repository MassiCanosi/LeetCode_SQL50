/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT 
product_id
, new_price
, ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) RN
FROM Products
WHERE change_date < '2019-08-17'
), CTE1 AS (
SELECT * FROM CTE WHERE CTE.RN=1
)
SELECT DISTINCT
p.product_id
, ISNULL(CTE1.new_price,10) AS price
FROM Products p
LEFT JOIN CTE1
  ON p.product_id = CTE1.product_id
