
-- What is the overall friend acceptance rate by date? 
-- Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.
-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user 
-- (i.e., user_id_receiver) that's logged in the table with action = 'sent'. 
-- If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, 
-- no record of action = 'accepted' is logged.

select date, cast(sum(accept) as decimal)/cast(sum(sent) as decimal)
from (
    select date, user_id_sender, user_id_receiver, 1 as sent
    from fb_friend_requests
    where action = 'sent'
) a
left join (
    select user_id_sender, user_id_receiver, 1 as accept
    from fb_friend_requests
    where action = 'accepted'
) b on a.user_id_sender = b.user_id_sender and a.user_id_receiver = b.user_id_receiver
group by date;

