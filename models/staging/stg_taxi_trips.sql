select
    pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    fare_amount,
    payment_type,
    pickup_location_id as pulocation_id,
from {{ source('nyc_taxi_data', 'tlc_yellow_trips_2018') }}
where passenger_count is not null
limit 10000 -- Let's limit our initial run to 10k records for speed