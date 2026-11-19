/*
fact_sales - Упрощённый вариант без вычислений
*/
select
    date,
    order_id,
    user_id,
    product,
    price,
    quantity,
    store
from {{ ref("stg_sales") }}

