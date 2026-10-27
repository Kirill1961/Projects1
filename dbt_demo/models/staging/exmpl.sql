{#{{ config(materialized='table') }}#}

{#select *#}
{#from {{ source("shop", "raw_orders") }}#}

select
    date,
    product
from {{ source("shop", "raw_orders") }}
{#group by date, product#}
{#order by date#}