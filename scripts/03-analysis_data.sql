-- Preamble
-- Purpose: To analyze the grocery data, including calculations of averages, trends, and other insights.
-- Author: Jinyan Wei
-- Date: 12 November 2024
-- Contact: jinyan.wei@utoronto.ca
-- License: MIT
-- Pre-requisites:
--   - A cleaned and populated 'GroceryData' table ready for analysis.
--   - Access to run SELECT and aggregate functions in the SQLite environment.

-- Calculate average price by vendor
SELECT vendor, AVG(current_price) AS avg_price
FROM GroceryData
GROUP BY vendor
ORDER BY avg_price ASC;

-- Retrieve price trends over time by vendor
SELECT nowtime, vendor, current_price
FROM GroceryData
ORDER BY nowtime, vendor;

-- Find the cheapest product by vendor
SELECT vendor, product_name, MIN(current_price) AS lowest_price
FROM GroceryData
GROUP BY vendor;

-- Count of unique products by vendor
SELECT vendor, COUNT(DISTINCT product_id) AS product_count
FROM GroceryData
GROUP BY vendor;
