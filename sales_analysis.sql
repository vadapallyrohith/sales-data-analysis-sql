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

-- High value orders
SELECT * FROM orders
WHERE Sales > 1000;

-- Only West region
SELECT * FROM orders
WHERE Region = 'West';

-- Specific categories
SELECT * FROM orders
WHERE Category IN ('Furniture', 'Technology');

-- Sales by category in West region
SELECT Category, SUM(Sales) AS total_sales
FROM orders
WHERE Region = 'West'
GROUP BY Category;

-- Only profitable Regions
SELECT Region, SUM(Profit) AS total_profit
FROM orders
WHERE Profit > 0
GROUP BY Region;

-- Loss making categories
SELECT Category, SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
HAVING total_profit < 0;

-- Top 5 states in West region
SELECT State, SUM(Sales) AS total_sales
FROM orders
WHERE Region = 'West'
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;

SELECT Category,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
HAVING SUM(Sales) > 50000 AND SUM(Profit) < 5000;

-- Medium value orders; (returns values from 100 to 500)
SELECT * FROM orders
WHERE Sales BETWEEN 100 AND 500;
-- or
SELECT * FROM orders
WHERE Sales >= 100 AND Sales <= 500;

-- Medium value orders; (returns values from 101 to 499)
SELECT * FROM orders
Sales > 100 AND Sales < 500

--Show all orders from the West region where Sales are between 100 and 500, ordered by Profit in descending order.---
SELECT *
FROM Orders
WHERE Region = 'West'
  AND Sales BETWEEN 100 AND 500
ORDER BY Profit DESC;


--How much sales does each regional manager oversee?
SELECT
    o.Region,
    r.Manager,
    SUM(o.Sales) AS Total_Sales
FROM orders o
INNER JOIN region_info r
ON o.Region = r.Region
GROUP BY o.Region, r.Manager;


--Which regional manager has higher sales?
SELECT
    o.Region,
    r.Manager,
    SUM(o.Sales) AS Total_Sales
FROM orders o
INNER JOIN region_info r
ON o.Region = r.Region
GROUP BY o.Region, r.Manager
ORDER BY SUM(o.Sales) DESC;

--Total Profit by Manager
Select r.manager,
sum(o.profit) as Total_Profit
From orders o
inner join region_info r
on o.region = r.region
Group by r.manager;


--Number of Orders by Manager
Select r.manager,
count(*) as Total_Orders
From orders o
inner join region_info r
on o.region = r.region
Group by r.manager;


--Average Sales by Manager
Select r.manager,
avg(o.sales) as Avg_Sales
From orders o
inner join region_info r
on o.region = r.region
Group by r.manager;


--Total Sales and Profit Together
Select r.manager,
sum(o.sales) as Total_Sales,
sum(o.profit) as Total_Profit
From orders o
inner join region_info r
on o.region = r.region
Group by r.manager;


-- PARTITION BY temporarily groups rows for a calculation, then returns every original row.
-- PARTITION BY creates temporary groups for calculations without collapsing the dataset.

-- Sales by Region
SELECT
    Region,
    Sales,
    SUM(Sales) OVER(PARTITION BY Region) AS Region_Total
FROM Orders;

-- Average Sales by Region
SELECT
    Region,
    Sales,
    AVG(Sales) OVER(PARTITION BY Region) AS Avg_Regional_Sales
FROM Orders;

-- Number Orders Within Region
SELECT
    Region,
    Sales,
    COUNT(*) OVER(PARTITION BY Region) AS Orders_In_Region
FROM Orders;


-- Sales in City using ROW_NUMBER, RANK, DENSE_RANK
-- ROW_NUMBER(), RANK(), and DENSE_RANK() differ only in how they handle ties.
SELECT
    City,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_Num
FROM Orders;

SELECT
    City,
    Sales,
    RANK() OVER(ORDER BY Sales DESC) AS Sales_Rank
FROM Orders;

SELECT
    City,
    Sales,
    DENSE_RANK() OVER(ORDER BY Sales DESC) AS Dense_Rank
FROM Orders;
