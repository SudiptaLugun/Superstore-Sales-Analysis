
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

--What is the total sales revenue?
SELECT SUM(sales) AS total_sales_revenue FROM superstore_sales;

--Which category generates the highest sales?
SELECT category, MAX(sales) FROM superstore_sales
GROUP BY category
ORDER BY MAX(sales) DESC;

--Which sub-category performs best?
SELECT sub_category, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_sales DESC;

--Which region generates the most revenue?
SELECT region, SUM(sales) AS total_revenue FROM superstore_sales
GROUP BY region
ORDER BY total_revenue DESC;

--Which year has the highest sales?
SELECT EXTRACT(year FROM order_date) AS year,
SUM(sales) AS yearly_sales FROM superstore_sales
GROUP BY EXTRACT(year FROM order_date)
ORDER BY SUM(sales) DESC;

--Which customers place the most orders?
SELECT customer_name, COUNT(DISTINCT order_id) AS orders
FROM superstore_sales
GROUP BY customer_name
ORDER BY COUNT(DISTINCT order_id) DESC;

--What is the monthly sales trend?
SELECT month_year, SUM(sales) AS monthly_revenue
FROM superstore_sales
GROUP BY month_year
ORDER BY MIN(order_date);

--Which shipping mode is most popular?
SELECT ship_mode, COUNT(*) AS total_shipment
FROM superstore_sales
GROUP BY ship_mode
ORDER BY COUNT(*) DESC;

--Which cities generate the highest sales?
SELECT city, SUM(sales) AS total_sales 
 FROM superstore_sales
 GROUP BY city
 ORDER BY SUM(sales) DESC;

--What are the top 10 products by sales?
SELECT product_id, SUM(sales) AS product_revenue
FROM superstore_sales
GROUP BY product_id
ORDER BY SUM(sales) DESC 
LIMIT 10;

