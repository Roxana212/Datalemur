--Assume you're given a table Twitter tweet data, output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
WITH total_tweets AS (
SELECT user_id,
COUNT(tweet_id) AS tweet_per_user
FROM tweets
WHERE tweet_date BETWEEN '2022-01-01' AND '2023-01-01'
GROUP BY 1) 

SELECT tweet_per_user AS tweet_bucket,
COUNT (*) AS user_num
FROM total_tweets
GROUP BY tweet_per_user

--Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. 
--Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
WITH mobile AS( 
  SELECT COUNT(view_time) AS mobile_view
  FROM viewership
  WHERE device_type IN ('tablet', 'phone') ),

laptop_count AS( 
 SELECT COUNT(view_time) AS laptop_view
 FROM viewership
 WHERE device_type='laptop')

SELECT 
laptop_count.laptop_view, mobile.mobile_view
FROM mobile, laptop_count

--
