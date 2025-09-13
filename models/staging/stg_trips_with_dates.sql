select
    *,
    cast(pickup_datetime as date) as pickup_date
from {{ source('nyc_taxi_data', 'tlc_yellow_trips_2018') }}