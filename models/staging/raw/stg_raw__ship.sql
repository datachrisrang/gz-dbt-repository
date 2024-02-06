with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logCost as log_cost,
        cast(ship_cost as FLOAT64) as ship_cost

    from source
    where shipping_fee = shipping_fee_1
    
)

select
    orders_id,
    shipping_fee,
    log_cost,
    ship_cost 
from renamed
