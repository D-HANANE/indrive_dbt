
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    driver_day_id as unique_field,
    count(*) as n_records

from "indrive_warehouse"."dbt_dev"."fct_driver_daily_earnings"
where driver_day_id is not null
group by driver_day_id
having count(*) > 1



  
  
      
    ) dbt_internal_test