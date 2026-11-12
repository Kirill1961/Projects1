
/*
1 Модель делает:
    * Выбор нужных полей
    * Приводит к Типам
    * Фильтрует Null
2 dbt читает schema и число столбцов должно быть = числу тестов в schema
3 Все этапы модели должны быть в одном select

*/
with columns_cast as(
    select
        cast(order_id as integer) as order_id,
        cast(user_id as integer) as user_id,
        cast(date as date) as date,
        cast(price as decimal(10,2)) as price,
        cast(quantity as integer) as quantity,
        cast(product as varchar) as product,
        cast(store as varchar) as store
    from {{ source("shop", "raw_orders") }}
    )
select
    order_id,
    user_id,
    product,
    price,
    quantity,
    store,
    date
from columns_cast
where order_id is not null
	and user_id is not null
	and product is not null
	and price is not null
	and quantity is not null
	and store is not null
	and date is not null



