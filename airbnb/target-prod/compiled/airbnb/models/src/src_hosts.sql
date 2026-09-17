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