/* Write your T-SQL query statement below */
WITH CTE AS (
SELECT DISTINCT
c.customer_id
, COUNT(DISTINCT c.product_key) AS product_per_customer
FROM Customer c
JOIN Product p 
  ON c.product_key = p.product_key
GROUP BY 
c.customer_id
)
SELECT 
CTE.customer_id
FROM CTE 
JOIN (
  SELECT 
  COUNT(DISTINCT product_key) as total
  FROM Product
) a on CTE.product_per_customer = a.total 



