
  
    

  create  table "indrive_warehouse"."dbt_dev"."dim_vehicle__dbt_tmp"
  
  
    as
  
  (
    select * from "indrive_warehouse"."dbt_dev"."stg_vehicles"
  );
  