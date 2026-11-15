select
    date,
    f.order_id,
    f.user_id,
    f.store,
    dp.product,
    dp.price,
    f.quantity,
    (dp.price * f.quantity) as revenue
from {{ ref("dim_product") }} as dp
left join {{ ref("fact_sales") }} as f
on f.product = dp.product