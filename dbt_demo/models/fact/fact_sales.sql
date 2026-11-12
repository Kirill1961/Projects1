select
strftime(date,'%Y-%m') as monthes,
{#date_trunc('day', date),#}
{#pg_typeof(date)#}
{#    order_id,#}
{#    user_id,#}
{#    product,#}
{#    price,#}
{#    quantity,#}
    store,
    sum(price * quantity) as revenue
{#sum(price * quantity) over(partition by store order by store desc) as wind#}
from {{ ref("stg_sales") }}
group by strftime(date,'%Y-%m'), store
{#group by date#}
{#group by store#}
order by monthes