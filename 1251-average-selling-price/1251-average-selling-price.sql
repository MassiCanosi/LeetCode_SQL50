/* Write your T-SQL query statement below */

SELECT
P.product_id
, ISNULL(Round(sum(p.price*us.units)*1.0/sum(us.units),2),0) AS average_price
FROM Prices P
LEFT JOIN UnitsSold US 
    ON P.product_id = US.product_id
    AND US.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY 
P.product_id
