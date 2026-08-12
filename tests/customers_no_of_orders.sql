{{
    config(
        severity ='error',
        error_if = '<30'
    )
}}

select *
from {{ ref('dim_customers') }}
WHERE number_of_orders =1