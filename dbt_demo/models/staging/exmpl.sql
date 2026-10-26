{{ config(materialized='table') }}

select
    price,
    quantity,
    store

from {{ source("shop", "raw_orders") }}


