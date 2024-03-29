with subquery AS (
    SELECT
        date_date,
        orders_id,
        revenue,
        product.products_id,
        quantity,
        purchase_price * quantity AS purchase_cost
        
    FROM {{ref("stg_raw__sales")}} AS sales
    JOIN {{ref("stg_raw__product")}} AS product
    ON sales.products_id = product.products_id
)
select
 orders_id,
 date_date,
 round(sum(quantity),2) as quantity,
 round(sum(revenue),2) as revenue,
 round(sum(purchase_cost),2) as purchase_cost,
 sum(round((revenue - purchase_cost),2)) as margin
from subquery
group by orders_id,date_date