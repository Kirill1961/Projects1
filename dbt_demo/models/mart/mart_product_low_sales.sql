/*
mart_product_low_sales
Магазин, доход и позиция - которая которая даёт меньший доход
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
    dense_rank() over(partition by store order by sum_rev ) = 1
order by store


