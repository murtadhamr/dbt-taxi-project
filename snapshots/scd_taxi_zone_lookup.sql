{% snapshot scd_taxi_zone_lookup %}

{{
    config(
      target_schema='snapshots',
      strategy='check',
      unique_key='zone_id',
      check_cols=['zone', 'borough'],
    )
}}

select * from {{ ref('taxi_zone_lookup_mutable') }}

{% endsnapshot %}