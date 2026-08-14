with orders as (
    select * from {{ ref('stg_jaffle_shop__orders')}}
),

payments as (
    select * from {{ ref('stg_stripe_payments')}}
),

customers as (
    select * from {{ ref('stg_jaffle_shop__customers') }}
),

order_payments as (
    select 
        order_id,
        sum( case when status = 'success' then amount end) as amount
    from payments
    group by 1
),

final as (
    select
        orders.order_id,
        customers.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount
    from orders
    left join order_payments using (order_id)
    left join customers using (customer_id)

)

select * from final