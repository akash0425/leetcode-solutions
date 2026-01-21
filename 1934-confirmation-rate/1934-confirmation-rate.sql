SELECT s.user_id, ROUND(SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(*), 2) AS confirmation_rate
from Signups s
left join Confirmations C
on s.user_id = C.user_id
group by user_id
ORDER BY user_id;