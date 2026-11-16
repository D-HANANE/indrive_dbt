select driver_id, driver_name, phone, city, rating, joined_date
from "indrive_warehouse"."snapshots"."drivers_snapshot"
where dbt_valid_to is null