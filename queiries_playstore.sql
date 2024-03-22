-- find the app with id = 1880 --

SELECT * FROM analytics
    WHERE id = 1880;

-- find id and name for apps updated on 8-1-18 --

SELECT id, app_name FROM analytics
    WHERE last_updated = '2018-08-01';

-- return the count of apps in each category --

SELECT category, COUNT(*) FROM analytics
    GROUP BY category;

-- find top 5 most reviewed apps and number of reviews for each --

SELECT * FROM analytics
    ORDER BY reviews DESC
    LIMIT 5;

-- find apps with rating at or over 4.8 and return the one with the most reviews --

SELECT * FROM analytics
    WHERE rating >= 4.8
    ORDER BY reviews DESC
    LIMIT 1;

-- find average rating for each category, order highest to lowest rated --

SELECT category, AVG(rating) FROM analytics
    GROUP BY category
    ORDER BY avg DESC

-- find name, price, rating of most expensive app with rating below 3 --

SELECT app_name, price, rating FROM analytics
    WHERE rating < 3
    ORDER BY price DESC
    LIMIT 1;

-- find apps with a min install 50 or less with a rating, order highest to lowest rating --

SELECT * FROM analytics
    WHERE min_installs <= 50
        AND rating IS NOT NULL
    ORDER BY rating DESC;

-- find names of apps rated less than 3 with at least 10000 reviews --

SELECT app_name FROM analytics
    WHERE rating < 3 AND reviews >= 10000;

-- ten most reviewed apps that cost between .1 and 1 --

SELECT * FROM analytics
    WHERE price BETWEEN 0.1 AND 1
    ORDER BY reviews DESC
    LIMIT 10;

-- most out of date app --

SELECT * FROM analytics
    ORDER BY last_updated
    LIMIT 1;

-- most expensive app --

SELECT * FROM analytics
    ORDER BY price DESC
    LIMIT 1;
    

-- count total number of reviews in play store --

SELECT SUM(reviews) AS "all_reviews" FROM analytics;

-- all categories that have more than 300 apps --

SELECT * FROM analytics
    GROUP BY category
    HAVING COUNT(*) > 300;

-- find app with highest proportion of min instals to reviews, among apps that have been installed at least 100_000 times --
-- display name, number of reviews, min installs, and proportion --

SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion FROM analytics
    WHERE min_installs >= 100000
    ORDER BY proportion DESC
    LIMIT 1;