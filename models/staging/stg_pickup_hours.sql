select  
    pickup_datetime,
    extract(hour from pickup_datetime) as pickup_hour
from {{ source('nyc_taxi_data', 'tlc_yellow_trips_2018') }}