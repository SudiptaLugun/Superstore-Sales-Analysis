
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
SELECT DISTINCT ship_mode FROM superstore_sales;

--Categorize sales as High, Medium or Low.
SELECT order_id, sales,
CASE 
WHEN sales>=500 THEN 'high'
WHEN sales>=200 THEN 'medium'
ELSE 'low'
END AS sales_category
FROM superstore_sales;

--Classify shipping modes into Fast and Regular.
SELECT order_id, ship_mode,
CASE 
WHEN ship_mode ='Same day' THEN 'Fast'
WHEN ship_mode ='First class' THEN 'Fast'
ELSE 'Regular'
END AS Shipping_modes
FROM superstore_sales;

--Categorize orders by quarter based on order date.
SELECT order_id, order_date, 
CASE
WHEN EXTRACT(MONTH FROM order_date) BETWEEN 1 AND 3 THEN 'Q1'
WHEN EXTRACT (MONTH FROM order_date) BETWEEN 4 AND 6 THEN 'Q2'
WHEN EXTRACT(MONTH FROM order_date) BETWEEN 7 AND 9 THEN 'Q3'
ELSE 'Q4'
END AS order_quarter
FROM superstore_sales;

--. Classify delivery time as Fast, Normal or Slow.
SELECT order_id, ship_date-order_date AS delivery_days,
CASE
WHEN ship_date-order_date <=2 THEN 'Fast'
WHEN ship_date-order_date <=5 THEN 'Normal'
ELSE 'Slow'
END AS delivery_status
FROM superstore_sales;

--Classify customers as B2B or B2C.
SELECT customer_name, segment,
CASE 
WHEN segment = 'customer' THEN 'B2C'
ELSE 'B2B'
END AS customer_type
FROM superstore_sales;

--Categorize customers based on their segment.
SELECT customer_name, segment,
CASE 
WHEN segment = 'consumer' THEN 'individual'
WHEN segemnt = 'corporate' THEN 'business'
ELSE 'small business'
END AS customer_category
FROM superstore_sales;

--Categorize orders based on the year they were placed.
SELECT order_id, order_date,
CASE 
WHEN EXTRACT(YEAR FROM order_date) = 2019 THEN 'Year 2019'
WHEN EXTRACT(YEAR FROM order_date) = 2020 THEN 'Year 2020'
ELSE 'Other year'
END AS Order_year
FROM superstore_sales;

--Categorize orders based on shipping days.
SELECT order_id, ship_date-order_date AS shipping_days,
CASE 
WHEN ship_date-order_date <=3 THEN 'Quick'
ELSE 'delayed'
END AS shipping_status
FROM superstore_sales;

--Categorize sales as Profitable or Non-Profitable based on sales value.
SELECT order_id, sales,
CASE 
WHEN sales >=500 THEN 'high sales'
ELSE 'low sales'
END AS sales_status
FROM superstore_sales;

--Categorize orders as Large or Small based on sales value.
SELECT order_id, sales,
CASE 
WHEN sales >=1000 THEN 'Large'
ELSE 'Small'
END AS order_category
FROM superstore_sales;