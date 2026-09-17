
select  * 
FROM {{ref('dim_listings_cleansed')}}
where MINIMUM_NIGHTS < 1
LIMIT 10 