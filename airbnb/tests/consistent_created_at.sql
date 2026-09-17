select fr.listing_id, fr.review_date, lc.created_at
FROM {{ref('fact_reviews')}} fr
join {{ref('dim_listings_cleansed')}} lc on fr.listing_id = lc.listing_id
where fr.review_date < lc.created_at