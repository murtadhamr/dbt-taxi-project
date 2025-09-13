select
    {{ decode_payment_type('cast(payment_type as STRING)') }} as payment_type_description,
    count(1) as number_of_trips
from {{ ref('stg_taxi_trips') }}
group by 1
order by 2 desc