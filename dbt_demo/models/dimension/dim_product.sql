select
    product,
    price,
    quantity
from {{ ref("stg_sales") }}
group by product, price, quantity

