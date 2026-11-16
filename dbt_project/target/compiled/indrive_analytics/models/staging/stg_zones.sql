select
    cast(zone_id as integer) as zone_id,
    cast(zone_name as text) as zone_name,
    cast(city as text) as city
from "indrive_warehouse"."raw"."raw_zones"