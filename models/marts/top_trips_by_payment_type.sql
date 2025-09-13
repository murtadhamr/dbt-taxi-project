with ranked_trips as (
    select
        {{ decode_payment_type('cast(payment_type as STRING)') }} as payment_type_description,
        trip_distance,
        row_number() over(partition by payment_type order by trip_distance desc) as trip_rank
    from {{ ref('stg_taxi_trips') }}
)

select
    payment_type_description,
    trip_distance,
    trip_rank
from
    ranked_trips
where
    trip_rank <= 3
order by
    payment_type_description,
    trip_rank