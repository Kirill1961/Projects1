/*
mart_top_quantity
Самая продающаяся Позиция для магазинов А, В, С
*/
select
store,
product,
sum_qnt,
dense_rank() over(partition by store order by sum_qnt desc) as top_quantity
from
    (select
        store,
        product,
        sum(quantity) as sum_qnt
    from {{ ref ("mart_sales") }}
    group by store, product
{#    order by store#}
    )
QUALIFY
    dense_rank() over(partition by store order by sum_qnt desc) = 1