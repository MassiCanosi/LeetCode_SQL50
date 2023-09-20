# Write your MySQL query statement below
SELECT pr.product_id
FROM Products pr 
WHERE 
pr.low_fats = 'Y'
and pr.recyclable = 'Y'