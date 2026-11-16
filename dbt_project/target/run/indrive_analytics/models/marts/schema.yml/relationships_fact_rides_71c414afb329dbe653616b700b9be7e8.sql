
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select dropoff_zone_id as from_field
    from "indrive_warehouse"."dbt_dev"."fact_rides"
    where dropoff_zone_id is not null
),

parent as (
    select zone_id as to_field
    from "indrive_warehouse"."dbt_dev"."dim_zone"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test