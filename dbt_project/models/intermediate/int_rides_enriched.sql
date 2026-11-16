{{ config(materialized='ephemeral') }}
select
    r.ride_id,
    r.driver_id,
    v.vehicle_id,
    r.pickup_zone_id,
    r.dropoff_zone_id,
    r.requested_at,
    cast(r.requested_at as date) as ride_date,
    r.distance_km,
    r.fare_amount,
    d.rating as driver_rating,
    {{ rating_bracket('d.rating') }} as rating_bracket
from {{ ref('stg_ride_events') }} r
left join {{ ref('drivers_snapshot') }} d
    on r.driver_id = d.driver_id and d.dbt_valid_to is null
left join {{ ref('stg_vehicles') }} v
    on r.driver_id = v.driver_id
