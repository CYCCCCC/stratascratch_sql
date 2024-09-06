
-- Find the number of apartments per nationality that are owned by people under 30 years old.
-- Output the nationality along with the number of apartments.
-- Sort records by the apartments count in descending order.

select nationality, count(distinct unit_id) as apartment_count
from airbnb_hosts a
left join airbnb_units b on a.host_id = b.host_id
where age < 30 and unit_type = 'Apartment'
group by nationality
order by apartment_count desc;
