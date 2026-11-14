select
    date,
    order_id,
    user_id,
    d.product,
    d.price,
    quantity,
    store,
    (d.price * quantity) as revenue
from {{ ref("dim_product") }} as f
left join {{ ref("fact_sales") }} as d
on f.product = d.product