select
    zone_id,
    zone_name,
    borough,
    zone_geom
from
    {{ source('nyc_taxi_data', 'taxi_zone_geom') }}