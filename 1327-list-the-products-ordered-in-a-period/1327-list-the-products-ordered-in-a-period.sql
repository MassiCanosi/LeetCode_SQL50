/* Write your T-SQL query statement below */
SELECT * FROM (
SELECT 
P.product_name
, SUM(O.unit) as unit
FROM Products P 
JOIN Orders O
    ON P.product_id = O.product_id
WHERE 
YEAR(O.order_date) = 2020
AND MONTH(O.order_date) = 2
GROUP BY 
P.product_name
) a
WHERE a.unit >= 100
