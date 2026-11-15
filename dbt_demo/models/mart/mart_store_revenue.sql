/*
mart_store_revenue
Суммарная Выручка по магазинам
*/
select
    store,
    sum(revenue)
from {{ ref ("mart_sales") }}
group by store