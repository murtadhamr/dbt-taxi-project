select
    pickup_hour,
    count(1) as number_of_pickups
from {{ ref('stg_pickup_hours') }}
group by 1
order by 2 desc