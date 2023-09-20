/* Write your T-SQL query statement below */
WITH CTE AS (
  SELECT * FROM(
    SELECT 
    product_id
    , new_price
    , ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) RN
    FROM Products
    WHERE change_date < '2019-08-17'
    ) a
  WHERE a.RN=1
)
SELECT DISTINCT
p.product_id
, ISNULL(CTE.new_price,10) AS price
FROM Products p
LEFT JOIN CTE
  ON p.product_id = CTE.product_id
