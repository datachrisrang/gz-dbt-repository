with subquery AS (
    SELECT
        orders_id,
        product.products_id,
        quantity,
        revenue,
        purchase_price * quantity AS purchase_cost
        
    FROM {{ref("stg_raw__sales")}} AS sales
    JOIN {{ref("stg_raw__product")}} AS product
    ON sales.products_id = product.products_id
)
select
 *,
 round((revenue - purchase_cost),2) as margin
 ,{{margin_percent('revenue', 'purchase_cost')}} as margin_percent
from subquery