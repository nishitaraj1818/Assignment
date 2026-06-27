/* =====================================================
   SQL SALES ANALYSIS PROJECT
   Dataset: Superstore
   Table Name: orders
===================================================== */

-----------------------------------------------------
-- 1. View Sample Data
-----------------------------------------------------

SELECT *
FROM orders
LIMIT 10;

-----------------------------------------------------
-- 2. Table Structure (SQLite)
-----------------------------------------------------

PRAGMA table_info(orders);

-----------------------------------------------------
-- 3. Filter Data Using WHERE
-----------------------------------------------------

SELECT *
FROM orders
WHERE Region = 'West'
LIMIT 10;

SELECT *
FROM orders
WHERE Category = 'Furniture'
LIMIT 10;

SELECT *
FROM orders
WHERE Sales > 500;

SELECT *
FROM orders
WHERE "Order Date" BETWEEN '2016-01-01' AND '2016-12-31';

-----------------------------------------------------
-- 4. Sales Performance by Region
-----------------------------------------------------

SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Quantity) AS total_quantity
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

-----------------------------------------------------
-- 5. Average Sales & Profit by Category
-----------------------------------------------------

SELECT
    Category,
    AVG(Sales) AS avg_sales,
    AVG(Profit) AS avg_profit
FROM orders
GROUP BY Category
ORDER BY avg_sales DESC;

-----------------------------------------------------
-- 6. Top 10 Best-Selling Products
-----------------------------------------------------

SELECT
    "Product Name",
    SUM(Sales) AS total_sales
FROM orders
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

-----------------------------------------------------
-- 7. Top 5 Categories by Profit
-----------------------------------------------------

SELECT
    Category,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC
LIMIT 5;

-----------------------------------------------------
-- 8. Monthly Sales Trend
-----------------------------------------------------

SELECT
    strftime('%Y-%m', "Order Date") AS month,
    SUM(Sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-----------------------------------------------------
-- 9. Top 10 Customers
-----------------------------------------------------

SELECT
    "Customer Name",
    SUM(Sales) AS total_spend
FROM orders
GROUP BY "Customer Name"
ORDER BY total_spend DESC
LIMIT 10;

-----------------------------------------------------
-- 10. Duplicate Records Check
-----------------------------------------------------

SELECT
    "Order ID",
    "Product ID",
    COUNT(*) AS cnt
FROM orders
GROUP BY "Order ID", "Product ID"
HAVING COUNT(*) > 1;

-----------------------------------------------------
-- 11. Total Number of Records
-----------------------------------------------------

SELECT COUNT(*) AS total_records
FROM orders;

-----------------------------------------------------
-- 12. Missing Values Check
-----------------------------------------------------

SELECT COUNT(*) AS missing_sales
FROM orders
WHERE Sales IS NULL;

SELECT COUNT(*) AS missing_profit
FROM orders
WHERE Profit IS NULL;

SELECT COUNT(*) AS missing_quantity
FROM orders
WHERE Quantity IS NULL;

-----------------------------------------------------
-- END OF PROJECT
-----------------------------------------------------