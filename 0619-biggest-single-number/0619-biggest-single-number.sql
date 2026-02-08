# Write your MySQL query statement below
-- select
-- case when count(num)=1 then num else null end as num
-- from MyNumbers
-- group by num
-- order by num desc limit 1

select max(num) as num from
(select num,count(num) as freq
from MyNumbers
group by num
) as counted
where freq = 1