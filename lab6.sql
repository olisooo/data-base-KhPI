
select cities.name as Cities, regions.name as Regions
from cities join regions on cities.region =regions.uuid
where population > 350000;

select cities.name as NordRegionfrom cities join regions on cities.region =
regions.uuid
where regions.name = 'Nord';
