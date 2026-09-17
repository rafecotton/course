{{
    config(
    materialized = 'incremental',
    incremental_strategy = "microbatch",
    event_time = "review_date",
    begin = "2009-06-20",
    batch_size = "year",
    full_refresh = false,
    enabled = true,
    tags= ['fact'],
    schema='mart')
}}

WITH fct_reviews AS (
    SELECT * FROM {{ref('fact_reviews')}}
),
full_moon_dates as (
    SELECT * FROM {{ref('seed_full_moon_dates')}}
)

SELECT
    r.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM
    fct_reviews r 
    left join full_moon_dates fm
    on (to_date(r.review_date)) = dateadd(day, 1, fm.full_moon_date)