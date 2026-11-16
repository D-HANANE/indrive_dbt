
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ride_id
from "indrive_warehouse"."dbt_dev"."fact_rides"
where ride_id is null



  
  
      
    ) dbt_internal_test