/* Write your T-SQL query statement below */
SELECT 
s.product_id
, s.year as first_year
, s.quantity
, s.price
FROM Sales s
JOIN (
  SELECT
  product_id
  , MIN(year) as year
  FROM Sales
  GROUP BY 
  product_id
  ) a 
  on a.product_id = s.product_id
  and a.year = s.year

