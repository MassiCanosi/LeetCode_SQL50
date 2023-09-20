/* Write your T-SQL query statement below */
SELECT 
FORMAT(trans_date, 'yyyy-MM') as month
, country
, count(distinct id) as trans_count
, count(distinct case when state='approved' then id end) as approved_count
, sum(amount) as trans_total_amount
, ISNULL(sum(case when state='approved' then amount end),0) as approved_total_amount
FROM Transactions
GROUP BY 
FORMAT(trans_date, 'yyyy-MM') 
, country