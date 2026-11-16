
    
    

select
    ride_id as unique_field,
    count(*) as n_records

from "indrive_warehouse"."dbt_dev"."fact_rides"
where ride_id is not null
group by ride_id
having count(*) > 1


