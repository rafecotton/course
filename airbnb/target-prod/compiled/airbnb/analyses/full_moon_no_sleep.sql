-- sql in analyses folder is not materialised 

WITH fullmoon_reviews AS (
    SELECT * FROM AIRBNB.DBT_MYDEV_mart.mart_fullmoon_reviews
)
SELECT
    is_full_moon,
    review_sentiment,
    COUNT(*) as reviews
FROM
    fullmoon_reviews
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    is_full_moon,
    review_sentiment