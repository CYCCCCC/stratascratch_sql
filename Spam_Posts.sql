
-- Calculate the percentage of spam posts in all viewed posts by day. 
-- A post is considered a spam if a string "spam" is inside keywords of the post. 
-- Note that the facebook_posts table stores all posts posted by users. 
-- The facebook_post_views table is an action table denoting if a user has viewed a post.

select post_date,
       sum(case when viewer_id is not null and post_keywords like '%spam%' then 1 else 0 end) 
       /count(viewer_id) ::float * 100 as spam_share
from facebook_posts a
left join facebook_post_views b on a.post_id = b.post_id
group by post_date;

