{{
    config(
        materialized='incremental'
    )
}}

select
    pickup_date,
    count(1) as total_trips,
    avg(trip_distance) as avg_trip_distance,
    avg(fare_amount) as avg_fare
from {{ ref('stg_trips_with_dates') }}

-- This Jinja block is the key to an incremental model
{% if is_incremental() %}

  -- This condition ensures we only process new records on subsequent runs
  -- It now correctly appears BEFORE the GROUP BY clause
  where pickup_date > (select max(pickup_date) from {{ this }})

{% endif %}

group by 1