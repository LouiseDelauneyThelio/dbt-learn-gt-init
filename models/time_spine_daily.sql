{{ config(materialized='table') }}

with date_spine as (

    {{
        dbt.date_spine(
            datepart='day',
            start_date="to_date('2017-01-01')",
            end_date="to_date('2030-01-01')"
        )
    }}

),

final as (

    select cast(date_day as date) as date_day
    from date_spine

)

select * from final
