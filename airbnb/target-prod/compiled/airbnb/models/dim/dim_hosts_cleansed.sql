
WITH  __dbt__cte__src_hosts as (
WITH raw_hosts as (
    select * from AIRBNB.raw.raw_hosts
)
SELECT
	ID as HOST_ID,
    Name as HOST_NAME,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
from raw_hosts
), SRC_HOSTS AS (
    SELECT * FROM __dbt__cte__src_hosts
)
SELECT
	HOST_ID,
    NVL(HOST_NAME, 'Anonymous') AS HOST_NAME,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM SRC_HOSTS