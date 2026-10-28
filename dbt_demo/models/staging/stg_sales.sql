{#select#}
{#    order_id,#}
{#    user_id,#}
{#    date,#}
{#    product,#}
{#    price,#}
{#    quantity,#}
{#    store#}
{#from#}
{#    {{ source("shop", "raw_orders") }}#}

select
    coalesce(order_id, 0)
from
    {{ source("shop", "raw_orders") }}