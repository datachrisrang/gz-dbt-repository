--Operational margin = margin + shipping fee - log_cost - ship_cost

select
    margin1.orders_id,
    margin1.date_date,
    round((margin1.margin + ship.shipping_fee - ship.log_cost - ship.ship_cost),2) as operational_margin    
    FROM {{ref("int_orders_margin")}} AS margin1
    JOIN {{ref("stg_raw__ship")}} AS ship
    using(orders_id)