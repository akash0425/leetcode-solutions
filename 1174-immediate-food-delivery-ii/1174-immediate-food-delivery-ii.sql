# Write your MySQL query statement below
-- with ok as (select *, row_number() over (partition by customer_id order by order_date) as 'rn'
-- , (case when order_date = customer_pref_delivery_date then 1.0 else 0 end) as 'immediate'
-- from Delivery)

-- select round(100*sum(immediate)/count(immediate),2) as 'immediate_percentage'
-- from ok
-- where rn=1

with cte as(SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
FROM Delivery)

SELECT ROUND(SUM(CASE WHEN rn = 1 AND order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 /
(SELECT COUNT(*) FROM cte
WHERE rn = 1), 2) AS immediate_percentage
FROM cte