
  create view "indrive_warehouse"."dbt_dev"."stg_drivers__dbt_tmp"
    
    
  as (
    select
    cast(driver_id as integer) as driver_id,
    cast(driver_name as text) as driver_name,
    cast(phone as text) as phone,
    cast(city as text) as city,
    cast(rating as numeric(3,2)) as rating,
    cast(joined_date as date) as joined_date
from "indrive_warehouse"."raw"."raw_drivers"
  );