select
    pickup_hour,
    count(1) as total_trips
from {{ ref('stg_pickup_hours') }}
group by 1
order by 2 desc