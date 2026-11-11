
CREATE TABLE superstore_sales (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales NUMERIC(12,2),
    order_year SMALLINT,
    order_day VARCHAR(20),
    month_year VARCHAR(20),
    shipping_days INTEGER,
    month VARCHAR(15),
    quarter VARCHAR(10)
);

--Find total sales for each product category.
SELECT category, SUM(sales) AS total_sales FROM superstore_sales
GROUP BY category
ORDER BY SUM(sales) DESC;

--Find the minimum sales recorded in each product category.
SELECT category, MIN(sales) AS minimum_sales
FROM superstore_sales
GROUP BY category;

--Find the total number of records in each customer segment.
SELECT segment, COUNT(*) AS total_orders
FROM superstore_sales
GROUP BY segment;

--Count the number of unique orders in each region.
SELECT region, COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY region
ORDER BY total_orders DESC;

--Find categories where total sales are greater than 100,000.
SELECT category, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY category
HAVING SUM(sales) > 100000;

--Find states having more than 100 unique orders.
SELECT state, COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY state
HAVING COUNT(DISTINCT order_id) > 100
ORDER BY total_orders DESC;

--Find the top 5 cities based on total sales.
SELECT city, SUM(sales) AS total_sales
 FROM superstore_sales
 GROUP BY city
 ORDER BY total_sales DESC
 LIMIT 5;

 --Find the earliest order date in each region.
 SELECT region, MIN(order_date) AS earliest_order
 FROM superstore_sales
 GROUP BY region;

 --Find cities where average sales are greater than 500.
 SELECT city, AVG(sales) AS average_sales
 FROM superstore_sales
 GROUP BY city 
 HAVING AVG(sales) > 500;