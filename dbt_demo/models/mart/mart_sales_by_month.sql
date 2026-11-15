/*
mart_sales_by_month
Выручка по магазинам по месяцам
Магазины с выручкой > 100000
*/
select
    strftime(date, '%Y-%m') as dt,
    store,
{#    revenue#}
    sum(revenue)
from {{ ref ("mart_sales") }}
group by strftime(date, '%Y-%m'), store
having sum(revenue) > 100000
order by dt
