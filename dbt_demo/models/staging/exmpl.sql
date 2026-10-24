{{ config(materialized='table') }}

select
    store,
    quantity,
    price
from {{ source("shop", "raw_orders") }}


