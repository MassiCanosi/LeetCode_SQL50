/* Write your T-SQL query statement below */
WITH RANKED AS (
SELECT 
Delivery.*
, ROW_NUMBER () OVER(PARTITION BY customer_id ORDER BY order_date ASC) RN
FROM Delivery
)
SELECT 
ROUND(CAST(COUNT(DISTINCT CASE WHEN order_date = customer_pref_delivery_date 
    THEN delivery_id
    END) AS DECIMAL)/CAST(count(*) AS DECIMAL)*100,2) as immediate_percentage
FROM RANKED r
WHERE r.rn = 1