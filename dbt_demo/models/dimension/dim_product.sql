select
    product,
    price
from {{ ref("stg_sales") }}
group by product, price

