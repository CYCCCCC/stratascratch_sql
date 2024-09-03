-- Calculate each user's average session time. 
-- A session is defined as the time difference between a page_load and page_exit. 
-- For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session time.

with max_session as (
    select user_id, date(timestamp) as day, max(timestamp) as page_load
    from facebook_web_log
    where action = 'page_load'
    group by user_id, date(timestamp)
    ),
    min_session as (
    select user_id, date(timestamp) as day, min(timestamp) as page_exit
    from facebook_web_log
    where action = 'page_exit'
    group by user_id, date(timestamp)
    )

select user_id, avg(session_duration) as avg_session_duration
from (
    select a.user_id, page_exit - page_load as session_duration
    from max_session a
    inner join min_session b 
    on a.user_id = b.user_id and a.day = b.day
) a
group by user_id


-- with session_order as (
--     select *, 
--         rank() over(partition by user_id order by timestamp) as session_rank
--     from facebook_web_log
--     where action in ('page_load', 'page_exit')
--     )

-- select user_id, avg(session_duration) as avg_session_duration
-- from (
--     select a.user_id, b.timestamp - a.timestamp as session_duration
--     from session_order a
--     inner join session_order b 
--     on a.user_id = b.user_id and a.session_rank = b.session_rank-1
--     where a.action = 'page_load' and b.action = 'page_exit'
-- ) a
-- group by user_id;

