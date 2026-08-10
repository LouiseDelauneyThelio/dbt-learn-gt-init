{{
    config(
        severity='error',
        error_if='>50',
        warn_if='>30'
    )
}}

select
    *
from {{ ref('dim_customers') }}
where number_of_orders < 1