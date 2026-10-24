select *
from {{ source('shop', 'raw_orders') }}



select
    order_id,
    price,
    quantity
from raw_orders
limit 5

from {{source("shop", "raw_orders")}}