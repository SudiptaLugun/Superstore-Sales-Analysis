
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

--Find sales records where sales are greater than average sales.
SELECT * FROM superstore_sales
WHERE sales > (
SELECT AVG(sales)
FROM superstore_sales);

--Find sales records where sales are less than average sales.
SELECT * FROM superstore_sales
WHERE sales <(
SELECT AVG(sales)
FROM superstore_sales
);

--Find the order with the highest sales.
SELECT * FROM superstore_sales
WHERE sales = (
SELECT MAX(sales)
FROM superstore_sales);

--Find orders placed on the earliest date.
SELECT * FROM superstore_sales
WHERE order_date = (
SELECT MIN(order_date)
FROM superstore_sales
);


--Find products belonging to the Technology category.
SELECT * FROM superstore_sales
WHERE product_id IN (
SELECT product_id 
FROM superstore_sales
WHERE category = 'Technology'
);

--Find customers who belong to the Consumer segment.
SELECT *
FROM superstore_sales
WHERE customer_id IN (
SELECT customer_id
FROM superstore_sales
WHERE segment = 'Consumer'
);

--Find orders having sales greater than 1,000.
SELECT *FROM superstore_sales 
WHERE order_id IN (
SELECT order_id 
FROM superstore_sales
WHERE sales > 1000
);

--Find records belonging to the West region.
SELECT * FROM superstore_sales
WHERE region IN (
SELECT region 
FROM superstore_sales
WHERE region = 'West'
);

--Find records belonging to the Corporate segment.
SELECT * FROM superstore_sales
WHERE segment IN (
SELECT segment 
FROM superstore_sales
WHERE segment = 'Corporate'
);