
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select driver_day_id
from "indrive_warehouse"."dbt_dev"."fct_driver_daily_earnings"
where driver_day_id is null



  
  
      
    ) dbt_internal_test