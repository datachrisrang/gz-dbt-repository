with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost

    from source
    where shipping_fee = shipping_fee_1
    
)

select
    orders_id,
    shipping_fee,
    logCost,
    ship_cost 
from renamed
