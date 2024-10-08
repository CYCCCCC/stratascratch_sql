
-- Write a query that'll identify returning active users. 
-- A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
-- Output a list of user_ids of these returning active users.

select distinct a.user_id
from amazon_transactions a
inner join amazon_transactions b
on a.user_id = b.user_id and a.id != b.id
where b.created_at - a.created_at >= 0 and b.created_at - a.created_at <= 7
order by a.user_id