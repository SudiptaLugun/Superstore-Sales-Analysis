
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

--Find total sales for each category.
WITH category_sales AS (
SELECT category, SUM(sales) AS total_sales 
FROM superstore_sales
GROUP BY category
)
SELECT * FROM category_sales;

--Find average sales for each region.
WITH region_sales AS (
SELECT region , AVG(sales) AS average_sales
FROM superstore_sales
GROUP BY region
)
SELECT * FROM region_sales;

--Find records where sales are greater than average sales.
WITH average_sales AS (
SELECT AVG(sales) AS avg_sales
FROM superstore_sales
)
SELECT * FROM superstore_sales
WHERE sales > (
SELECT avg_sales
FROM average_sales);

--Find total sales for each customer.
WITH customer_sales AS (
SELECT customer_id, customer_name, SUM(sales) AS total_sales
FROM superstore_sales 
GROUP BY customer_id , customer_name
)
SELECT * FROM customer_sales 
ORDER BY total_sales DESC;

--Find categories with total sales greater than 100,000.
WITH category_sales AS (
SELECT category, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY category
) 
SELECT * FROM category_sales
WHERE total_sales > 100000; 

--Find total sales for each year.
WITH yearly_sales AS (
SELECT order_year, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY order_year
)
SELECT * FROM yearly_sales
ORDER BY order_year;

--Find the top 5 cities based on sales.
WITH city_sales AS (
SELECT city, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY city
)
SELECT * FROM city_sales
ORDER BY total_sales DESC
LIMIT 5;

--Find average shipping days for each shipping mode.
WITH shipping_analysis AS (
SELECT ship_mode , AVG(shipping_days) AS average_days
FROM superstore_sales
GROUP BY ship_mode
)
SELECT * FROM shipping_analysis
ORDER BY average_days;

--Count unique customers in each segment.
WITH segment_customer AS (
SELECT segment, COUNT (DISTINCT customer_id) AS total_customers
FROM superstore_sales
GROUP BY segment
)
SELECT * FROM segment_customer;

--Find total sales for each sub-category. 
WITH subcategory_sales AS (
SELECT sub_category, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY sub_category
)
SELECT * FROM subcategory_sales
ORDER BY total_sales DESC;