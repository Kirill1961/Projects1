{{ config(materialized='table') }}

select
    quantity,
    store,
    price
from {{ source("shop", "raw_orders") }}


