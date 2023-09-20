/* Write your T-SQL query statement below */
WITH RANKED AS (
SELECT 
Delivery.*
, ROW_NUMBER () OVER(PARTITION BY customer_id ORDER BY order_date ASC) RN
FROM Delivery
), CNT AS (
SELECT 
COUNT(DISTINCT CASE WHEN order_date = customer_pref_delivery_date 
    THEN delivery_id
    END) as immediate
, count(*) as cnt 
FROM RANKED r
WHERE r.rn = 1
)
SELECT 
ROUND(CAST(c.immediate AS DECIMAL)/CAST(c.cnt AS DECIMAL)*100,2) as immediate_percentage
FROM CNT c