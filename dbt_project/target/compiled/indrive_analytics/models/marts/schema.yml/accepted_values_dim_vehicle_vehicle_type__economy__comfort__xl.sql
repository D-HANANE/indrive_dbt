
    
    

with all_values as (

    select
        vehicle_type as value_field,
        count(*) as n_records

    from "indrive_warehouse"."dbt_dev"."dim_vehicle"
    group by vehicle_type

)

select *
from all_values
where value_field not in (
    'economy','comfort','xl'
)


