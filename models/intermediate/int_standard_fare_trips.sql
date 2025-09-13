{{
    config(
        materialized='ephemeral'
    )
}}

select
    *
from {{ ref('stg_taxi_trips') }}
where fare_amount > 0