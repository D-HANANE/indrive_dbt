
  
    

  create  table "indrive_warehouse"."dbt_dev"."dim_driver__dbt_tmp"
  
  
    as
  
  (
    select driver_id, driver_name, phone, city, rating, joined_date
from "indrive_warehouse"."snapshots"."drivers_snapshot"
where dbt_valid_to is null
  );
  