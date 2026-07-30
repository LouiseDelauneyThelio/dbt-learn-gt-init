{{ config(materialized='table') }}

with days as (

    {{
        dbt.date_spine(
            'day',
            "dateadd(year, -5, current_date())",
            "dateadd(day, 31, current_date())"
        )
    }}

),

final as (

    select cast(date_day as date) as date_day
    from days

)

select * from final
