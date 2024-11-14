-- Preamble
-- Purpose: To verify that the simulated data has been correctly inserted and adheres to expected values.
-- Author: Jinyan Wei
-- Date: 12 November 2024
-- Contact: jinyan.wei@utoronto.ca
-- License: MIT
-- Pre-requisites:
--   - A populated 'GroceryData' table created by the "Simulate Data" script.
--   - Access to run SELECT queries in the SQLite environment.

-- Check the first few rows to ensure data looks as expected
SELECT * FROM GroceryData LIMIT 10;
