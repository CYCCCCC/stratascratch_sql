
-- Find the percentage of shipable orders.
-- Consider an order is shipable if the customer's address is known.

select sum(case when address is not null then 1 else 0 end) / count(*) ::float * 100 as percent_shipable
from orders a
left join customers b on a.cust_id = b.id;