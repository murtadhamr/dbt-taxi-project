select
    case
        when trip_distance < 1 then 'Short (Less than 1 mile)'
        when trip_distance between 1 and 5 then 'Medium (1-5 miles)'
        when trip_distance > 5 then 'Long (More than 5 miles)'
        else 'Unknown'
    end as distance_category,
    count(1) as total_trips
from {{ ref('stg_taxi_trips') }}
group by 1
order by 2 desc