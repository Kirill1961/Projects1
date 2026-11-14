select
    product,
    price
from {{ ref("stg_sales") }}
{#group by product, price, quantity, order_id, user_id, (price * quantity)#}

