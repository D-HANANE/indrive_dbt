with __dbt__cte__int_rides_enriched as (

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
    
case
    when d.rating is null then null
    when d.rating < 4.5 then 'moins de 4.5'
    when d.rating <= 4.8 then '4.5-4.8'
    else 'plus de 4.8'
end
 as rating_bracket
from "indrive_warehouse"."dbt_dev"."stg_ride_events" r
left join "indrive_warehouse"."snapshots"."drivers_snapshot" d
    on r.driver_id = d.driver_id and d.dbt_valid_to is null
left join "indrive_warehouse"."dbt_dev"."stg_vehicles" v
    on r.driver_id = v.driver_id
) -- Grain : une ligne par course identifiée par ride_id.

select
    ride_id, driver_id, vehicle_id, pickup_zone_id, dropoff_zone_id,
    requested_at, ride_date, distance_km, fare_amount,
    driver_rating, rating_bracket
from __dbt__cte__int_rides_enriched
