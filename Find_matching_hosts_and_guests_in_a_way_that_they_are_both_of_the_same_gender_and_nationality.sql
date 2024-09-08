
-- Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
-- Output the host id and the guest id of matched pair.

select distinct host_id, guest_id
from airbnb_hosts a
inner join airbnb_guests b on a.nationality = b.nationality and a.gender = b.gender;