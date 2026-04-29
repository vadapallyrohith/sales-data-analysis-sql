-- 1. View data
SELECT * FROM orders;

-- 2. Total number of rows
SELECT COUNT(*) FROM orders;

-- 3. Total sales
SELECT SUM(Sales) FROM orders;

-- 4. Average sales
SELECT AVG(Sales) FROM orders;

-- 5. Show only West region
SELECT * FROM orders
WHERE Region = 'West';

-- 6. Sales by region
SELECT Region, SUM(Sales) AS total_sales
FROM orders
GROUP BY Region;

-- 7. Number of orders per category
SELECT Category, COUNT(*) AS total_orders
FROM orders
GROUP BY Category;

-- 8. Top 5 highest sales
SELECT * FROM orders
ORDER BY Sales DESC
LIMIT 5;

-- 9. Total profit by category
SELECT Category, SUM(Profit) AS total_profit
FROM orders
GROUP BY Category;

-- 10. Sales by state (top 10)
SELECT State, SUM(Sales) AS total_sales
FROM orders
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;

-- 11. Which region has highest sales?
SELECT Region, SUM(Sales) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC
LIMIT 1;

-- 12. Which category is least profitable?
SELECT Category, SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit ASC
LIMIT 1;

-- 13. Sales by city (Top 5)
SELECT City, SUM(Sales) AS total_sales
FROM orders
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;

-- 14. Profit by region
SELECT Region, SUM(Profit) AS total_profit
FROM orders
GROUP BY Region;

