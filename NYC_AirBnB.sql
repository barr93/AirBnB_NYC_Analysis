-- NYC_AirBnB.sql
-- Advanced Analysis of New York City Airbnb Listings

-- Step 1: Drop the table if it exists (to avoid duplicates)
DROP TABLE IF EXISTS airbnb_listings;

-- Step 2: Create the airbnb_listings table
CREATE TABLE airbnb_listings (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    host_id INT,
    host_name VARCHAR(255),
    neighborhood_group VARCHAR(100),
    neighborhood VARCHAR(100),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(10, 8),
    room_type VARCHAR(50),
    price INT,
    minimum_nights INT,
    number_of_reviews INT,
    last_review DATE,
    reviews_per_month DECIMAL(3, 2),
    calculated_host_listings_count INT,
    availability_365 INT
);

-- Step 3: Import data from the CSV file (adjust file path as needed)
-- Ensure 'LOCAL' is allowed in MySQL settings. Use 'LOAD DATA LOCAL INFILE' if necessary.
LOAD DATA LOCAL INFILE '/Users/barry/Desktop/NYC_AirBnB_Analysis/Data/AB_NYC_2019.csv'
INTO TABLE airbnb_listings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Skip header row

-- Step 4: Verify data load
SELECT COUNT(*) AS total_records FROM airbnb_listings;
SELECT * FROM airbnb_listings LIMIT 10;

-- Basic Analysis Queries

-- 1. Summary Statistics for Price, Minimum Nights, and Availability
SELECT
    AVG(price) AS avg_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price,
    AVG(minimum_nights) AS avg_minimum_nights,
    AVG(availability_365) AS avg_availability
FROM airbnb_listings;

-- 2. Average Price by Neighborhood
SELECT neighborhood_group AS neighborhood,
       AVG(price) AS avg_price,
       COUNT(*) AS total_listings
FROM airbnb_listings
GROUP BY neighborhood_group
ORDER BY avg_price DESC;

-- Advanced Analysis Queries

-- 3. Top 10 Most Expensive Listings by Neighborhood (Advanced Aggregation with RANK)
SELECT id, name, neighborhood_group, price,
       RANK() OVER (PARTITION BY neighborhood_group ORDER BY price DESC) AS price_rank
FROM airbnb_listings
WHERE price IS NOT NULL
ORDER BY neighborhood_group, price_rank
LIMIT 10;

-- 4. Hosts with the Highest Average Listing Price (Advanced Grouping)
SELECT host_id,
       host_name,
       AVG(price) AS avg_host_price,
       COUNT(*) AS total_listings
FROM airbnb_listings
GROUP BY host_id, host_name
HAVING total_listings > 5  -- Only include hosts with more than 5 listings
ORDER BY avg_host_price DESC
LIMIT 10;

-- 5. Price Distribution Statistics by Room Type (Median Price Calculation)
SELECT room_type,
       AVG(price) AS avg_price,
       MIN(price) AS min_price,
       MAX(price) AS max_price,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price
FROM airbnb_listings
GROUP BY room_type;

-- 6. Neighborhoods with the Highest Density of Listings (Listings per Square Mile)
-- This assumes average lat/long are the same size in miles, which is an approximation.
SELECT neighborhood_group AS neighborhood,
       COUNT(*) AS listing_count,
       (COUNT(*) / 69) AS listings_per_square_mile  -- Approximation using a 69 sq mile radius
FROM airbnb_listings
GROUP BY neighborhood
ORDER BY listings_per_square_mile DESC;

-- 7. Correlation Check: Price vs. Number of Reviews
-- Here, we calculate basic metrics and assess if higher-priced listings have more reviews.
SELECT price,
       AVG(number_of_reviews) AS avg_reviews
FROM airbnb_listings
GROUP BY price
ORDER BY price DESC
LIMIT 20;

-- 8. Seasonality Insight: Listing Activity by Last Review Month
-- Shows activity trends across months to identify seasonal peaks.
SELECT MONTH(last_review) AS review_month,
       COUNT(*) AS reviews_count
FROM airbnb_listings
WHERE last_review IS NOT NULL
GROUP BY review_month
ORDER BY reviews_count DESC;

-- 9. Listings with High Minimum Stay Requirements, Categorized by Room Type (Advanced Filtering)
SELECT room_type,
       AVG(minimum_nights) AS avg_minimum_nights,
       MAX(minimum_nights) AS max_minimum_nights,
       COUNT(*) AS listings_count
FROM airbnb_listings
WHERE minimum_nights > 30
GROUP BY room_type
ORDER BY avg_minimum_nights DESC;

-- 10. Availability Analysis by Price Range
-- Segment listings into price ranges to understand availability trends.
SELECT CASE
           WHEN price < 50 THEN 'Low'
           WHEN price BETWEEN 50 AND 150 THEN 'Medium'
           ELSE 'High'
       END AS price_range,
       AVG(availability_365) AS avg_availability
FROM airbnb_listings
GROUP BY price_range
ORDER BY avg_availability DESC;

-- 11. Price Outliers Detection (Using Standard Deviation)
-- Identify price outliers that are significantly higher than the average.
SELECT id, name, price,
       AVG(price) OVER() AS avg_price,
       STDDEV(price) OVER() AS stddev_price
FROM airbnb_listings
WHERE price > (AVG(price) OVER() + 2 * STDDEV(price) OVER())  -- Price > 2 standard deviations above mean
ORDER BY price DESC;

-- Conclusion Queries

-- 12. Manhattan Key Statistics Comparison with City Averages
SELECT neighborhood_group AS neighborhood,
       AVG(price) AS avg_price,
       AVG(minimum_nights) AS avg_minimum_nights,
       AVG(availability_365) AS avg_availability
FROM airbnb_listings
WHERE neighborhood_group = 'Manhattan'
GROUP BY neighborhood
UNION ALL
SELECT 'City Average' AS neighborhood,
       AVG(price),
       AVG(minimum_nights),
       AVG(availability_365)
FROM airbnb_listings;
