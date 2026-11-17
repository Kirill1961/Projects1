/*
mart_product_top_sales
Магазин, доход и позиция - которая которая даёт больший доход
*/
with sum_sale as (select
        store,
        product,
        sum(revenue) as sum_rev
    from {{ ref ("mart_sales") }}
    group by store, product)
select
    store,
    product,
    sum_rev
from sum_sale
QUALIFY
    dense_rank() over(partition by store order by sum_rev desc) = 1
order by store