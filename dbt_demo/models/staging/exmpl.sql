{{ config(materialized='table') }}

{#select *#}
{#from {{ source("shop", "raw_orders") }}#}

select
    pg_typeof(date),
    product
from {{ source("shop", "raw_orders") }}
{#group by date, product#}
{#order by date#}