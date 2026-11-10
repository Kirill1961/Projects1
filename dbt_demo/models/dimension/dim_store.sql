select distinct(store)
from {{ ref("stg_sales") }}
order by store