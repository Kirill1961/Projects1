/*
mart_product_low_sales
Магазин, доход и позиция - которая которая даёт меньший доход
*/
with sum_sale as (select
        store,
        product,
        sum(revenue) as sum_rev
    from {{ ref ("mart_sales") }}
    group by store, product),
min_sale as (select
          store,
          product,
    min(sum_rev) over(partition by store order by product) as min_rev
    from sum_sale
    order by store),
low as (select
        store,
        product,
        min_rev
        ,row_number() over(partition by store order by product desc) as rnk
    from min_sale)
select
        store,
        product,
        min_rev
from low
where rnk = 1
order by store


{#, low as (select#}
{#        store,#}
{#        product,#}
{#        min(min_rev) as low_rev#}
    {#    rank() over(order by product)#}
{#    from min_sale#}
{#    group by store, product)#}
{#select#}
{#    store,#}
{#    product,#}
{#    low_rev,#}
{#    rank() over(partition by store order by product desc) as rnk#}
{#from low#}
{#where rnk = 1#}
{#group by store, product#}

