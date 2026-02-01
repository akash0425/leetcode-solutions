# Write your MySQL query statement below
select contest_id,round((count(R.contest_id)/U.uid)*100,2) as percentage
from Register R
cross join (select count(user_id) as uid from Users) U
group by R.contest_id
order by percentage desc,contest_id