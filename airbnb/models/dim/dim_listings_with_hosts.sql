{{
    config(
    materialized = 'view')
}}
WITH L AS (
    SELECT * 
    FROM {{ref('dim_listings_cleansed')}}
),
H AS (
    SELECT * 
    FROM {{ref('dim_hosts_cleansed', v=2)}}
)
SELECT
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price as price_usd,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM L 
LEFT JOIN H ON h.host_id = l.host_id