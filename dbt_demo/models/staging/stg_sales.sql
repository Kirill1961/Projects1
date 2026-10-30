
/*
1 Модель делает:
    * Выбор нужных полей
    * Приводит к Типам
    * Фильтрует Null
2 dbt читает schema и число столбцов должно быть = числу тестов в schema
3 Все этапы модели должны быть в одном select

*/
select
    order_id,
    user_id,
    product,
    price,
    quantity,
    store,
    date,
    cast(order_id as integer),
    cast(user_id as integer),
    cast(date as date),
    cast(price as decimal(10,2)),
    cast(quantity as integer),
    cast(product as varchar),
    cast(store as varchar)
from {{ source("shop", "raw_orders") }}
where order_id is not null
	and user_id is not null
	and product is not null
	and price is not null
	and quantity is not null
	and store is not null
	and date is not null



