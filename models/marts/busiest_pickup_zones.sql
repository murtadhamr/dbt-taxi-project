select  
    zones.zone_name,
    zones.borough,
    count(1) as number_of_pickups
from    
    {{ ref('stg_taxi_trips') }} as trips
join
    {{ ref('stg_taxi_zone_lookup') }} as zones
on
    trips.pulocation_id = zones.zone_id
group by
    1, 2
order by
    3 desc
limit 5