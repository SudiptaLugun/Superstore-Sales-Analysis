
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

--Assign a row number to each sales record.
SELECT order_id, sales,
ROW_NUMBER() OVER ( ORDER BY sales DESC) AS row_num
FROM superstore_sales;

--Rank sales records from highest to lowest sales.
SELECT order_id , sales,
RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM superstore_sales;

--Rank categories based on total sales.
SELECT category, SUM(sales) AS total_sales,
RANK( ) OVER (ORDER BY category) AS category_rank
FROM superstore_sales
GROUP BY category;

--Calculate running total of sales based on order date.
SELECT order_date, sales,
SUM(sales) OVER ( 
ORDER BY order_date ) AS running_total
FROM superstore_sales;

--Calculate average sales for each region.
SELECT sales, region ,
AVG(sales) OVER (
PARTITION BY region
) AS avg_regional_sales
FROM superstore_sales;

--Find the difference between each sales record and the previous sales record.
SELECT order_date, sales, 
LAG(sales) OVER (
ORDER BY order_date 
) AS previous_sales
FROM superstore_sales;

--Find the next sales record using LEAD().
SELECT order_date, sales,
LEAD(sales) OVER(
ORDER BY order_date
) AS next_sales
FROM superstore_sales;

--Rank customers based on their total sales.
SELECT customer_id,customer_name,SUM(sales) AS total_sales,
DENSE_RANK() OVER (
ORDER BY SUM(sales) DESC
) AS customer_rank
FROM superstore_sales
GROUP BY customer_id,customer_name;

--Calculate total sales for each category without combining individual records.
SELECT order_id, sales, category,
SUM(sales) OVER ( 
PARTITION BY category
) AS category_total_sales
FROM superstore_sales;