-- Preamble
-- Purpose: To create and populate a table with simulated grocery data.
-- Author: Jinyan Wei
-- Date: 12 November 2024
-- Contact: jinyan.wei@utoronto.ca
-- License: MIT
-- Pre-requisites:
--   - An empty SQLite database file open in DB Browser for SQLite or another SQLite-compatible SQL environment.
--   - Ensure no table named 'GroceryData' already exists (or the script should be run with DROP TABLE IF EXISTS).
--   - Confirm that the SQLite environment allows executing INSERT statements.

 
-- Create the table for grocery data
CREATE TABLE IF NOT EXISTS GroceryData (
    nowtime TIMESTAMP,
    vendor TEXT,
    product_id INTEGER,
    product_name TEXT,
    brand TEXT,
    units TEXT,
    current_price REAL,
    old_price REAL,
    price_per_unit REAL,
    other TEXT
);
-- Step 1: Create the table for the grocery data
CREATE TABLE IF NOT EXISTS GroceryData (
    nowtime TIMESTAMP,
    vendor TEXT,
    product_id INTEGER,
    product_name TEXT,
    brand TEXT,
    units TEXT,
    current_price REAL,
    old_price REAL,
    price_per_unit REAL,
    other TEXT
);

-- Step 2: Insert simulated data into the table
INSERT INTO GroceryData (nowtime, vendor, product_id, product_name, brand, units, current_price, old_price, price_per_unit, other)
SELECT 
    datetime('now', '-' || ABS(RANDOM() % 100) || ' hours'),  -- Random timestamp within the last 100 hours
    CASE WHEN RANDOM() % 7 = 0 THEN 'Voila' 
         WHEN RANDOM() % 7 = 1 THEN 'T&T' 
         WHEN RANDOM() % 7 = 2 THEN 'Loblaws' 
         WHEN RANDOM() % 7 = 3 THEN 'No Frills' 
         WHEN RANDOM() % 7 = 4 THEN 'Metro' 
         WHEN RANDOM() % 7 = 5 THEN 'Galleria' 
         ELSE 'Walmart Canada' END,  -- Random vendor
    ABS(RANDOM() % 10000),  -- Random product_id
    CASE WHEN RANDOM() % 5 = 0 THEN 'Milk'
         WHEN RANDOM() % 5 = 1 THEN 'Cheese'
         WHEN RANDOM() % 5 = 2 THEN 'Apple'
         WHEN RANDOM() % 5 = 3 THEN 'Bread'
         ELSE 'Yogurt' END,  -- Random product name
    CASE WHEN RANDOM() % 3 = 0 THEN 'BrandA'
         WHEN RANDOM() % 3 = 1 THEN 'BrandB'
         ELSE 'BrandC' END,  -- Random brand
    CASE WHEN RANDOM() % 2 = 0 THEN '1kg'
         ELSE '500g' END,  -- Random units
    ROUND(1 + (ABS(RANDOM() % 1000) / 100.0), 2),  -- Random current_price between 1.00 and 10.00
    ROUND(1 + (ABS(RANDOM() % 1000) / 100.0), 2),  -- Random old_price between 1.00 and 10.00
    ROUND(0.5 + (ABS(RANDOM() % 500) / 100.0), 2),  -- Random price_per_unit between 0.50 and 5.00
    CASE WHEN RANDOM() % 4 = 0 THEN 'Best seller'
         WHEN RANDOM() % 4 = 1 THEN 'Out of stock'
         ELSE NULL END  -- Random other column
FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5);
