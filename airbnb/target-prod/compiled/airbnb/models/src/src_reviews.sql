WITH raw_reviews as (
    select * from AIRBNB.raw.raw_reviews
)
SELECT
	LISTING_ID 
	, DATE as review_date
	,REVIEWER_NAME 
	,COMMENTS as review_text
	,SENTIMENT as review_sentiment
from raw_reviews