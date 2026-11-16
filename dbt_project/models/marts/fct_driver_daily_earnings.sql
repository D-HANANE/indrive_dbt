with daily as (
    select driver_id, ride_date, sum(fare_amount) as daily_earnings
    from {{ ref('fact_rides') }}
    group by driver_id, ride_date
)
select
    cast(driver_id as text) || '_' || cast(ride_date as text) as driver_day_id,
    driver_id,
    ride_date,
    daily_earnings,
    sum(daily_earnings) over (
        partition by driver_id order by ride_date
        rows between unbounded preceding and current row
    ) as running_earnings,
    rank() over (
        partition by ride_date order by daily_earnings desc
    ) as daily_rank
from daily
