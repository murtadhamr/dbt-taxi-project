select
    {{ decode_payment_type('cast(payment_type as STRING)') }} as payment_type_description,
    avg(trip_distance) as avg_trip_distance_miles
from {{ ref('int_standard_fare_trips') }}
group by 1
order by 2 desc