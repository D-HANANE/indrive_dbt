
    
    

select
    ride_id as unique_field,
    count(*) as n_records

from "indrive_warehouse"."raw"."raw_ride_events"
where ride_id is not null
group by ride_id
having count(*) > 1


