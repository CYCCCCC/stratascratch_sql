
-- You are given a table of product launches by company by year. 
-- Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
-- Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.


select company_name, 
       count(case when year=2020 then 1 else 0 end) - count(case when year=2019 then 1 else 0 end) as net_products
from car_launches
group by company_name;


-- select a.company_name, pd_2020 - pd_2019 as net_products
-- from (
--     select company_name, count(product_name) as pd_2019
--     from car_launches
--     where year = 2019
--     group by company_name
-- ) a
-- full outer join (
--     select company_name, count(product_name) as pd_2020
--     from car_launches
--     where year = 2020
--     group by company_name
-- ) b
-- on a.company_name = b.company_name;