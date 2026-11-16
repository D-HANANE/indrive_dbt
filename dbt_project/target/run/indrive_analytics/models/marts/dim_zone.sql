
  
    

  create  table "indrive_warehouse"."dbt_dev"."dim_zone__dbt_tmp"
  
  
    as
  
  (
    select * from "indrive_warehouse"."dbt_dev"."stg_zones"
  );
  