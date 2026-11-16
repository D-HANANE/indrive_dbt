{% snapshot drivers_snapshot %}
{{ config(target_schema='snapshots', unique_key='driver_id',
          strategy='check', check_cols=['rating']) }}
select * from {{ ref('stg_drivers') }}
{% endsnapshot %}
