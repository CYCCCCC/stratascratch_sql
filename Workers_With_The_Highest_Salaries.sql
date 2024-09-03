-- You have been asked to find the job titles of the highest-paid employees.
-- Your output should include the highest-paid title or multiple titles with the same salary.


select distinct worker_title as best_paid_title
from worker a
inner join title b on a.worker_id = b.worker_ref_id
where a.salary = (select max(salary) from worker)


-- select distinct worker_title
-- from (
--     select *,
--     dense_rank() over(order by salary desc) as rank_no
--     from worker a
--     left join title b on a.worker_id = b.worker_ref_id
--     ) a
-- where a.rank_no = 1
