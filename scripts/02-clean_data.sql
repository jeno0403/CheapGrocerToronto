-- Preamble
-- Purpose: To clean the grocery dataset by handling NULLs and correcting inconsistencies.
-- Author: Jinyan Wei
-- Date: 12 November 2024
-- Contact: jinyan.wei@utoronto.ca
-- License: MIT
-- Pre-requisites:
--   - A populated 'GroceryData' table with data (either simulated or real).
--   - Ensure permission to modify records (DELETE, UPDATE) in the SQLite environment.

-- Remove rows where 'current_price' is NULL
DELETE FROM GroceryData WHERE current_price IS NULL;

-- Set any negative prices to positive values (if present)
UPDATE GroceryData
SET current_price = ABS(current_price)
WHERE current_price < 0;

-- Fill 'old_price' with 'current_price' if 'old_price' is NULL
UPDATE GroceryData
SET old_price = current_price
WHERE old_price IS NULL;
