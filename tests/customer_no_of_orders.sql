{{
    config(
        severity='warn'
    )
}}
SELECT * FROM {{ ref('dim_customers') }}
WHERE number_of_orders < 1