CREATE TABLE retail_sales(
    transaction_id INT,
    date DATE,
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(15),
    age INT,
    product_category VARCHAR(30),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

SELECT * FROM retail_sales;

-- TOTAL NUMBER OF CUSTOMER
SELECT COUNT(DISTINCT customer_id) AS TOTAL_CUSTOMER
FROM retail_sales;

-- TOTAL NUMBER OF FEMALE AND MALE CUSTOMERS
SELECT gender, COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
WHERE gender IN ('Male', 'Female')
GROUP BY gender;

-- TOTAL NUMBER OF PRODUCT PURCHASE MALE
SELECT gender, COUNT(product_category) AS total_product_category
FROM retail_sales
WHERE gender = 'Male'
GROUP BY gender;

-- TOTAL CUSTOMER EACH YEAR
SELECT EXTRACT(YEAR FROM date) AS year,
       COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
WHERE EXTRACT(YEAR FROM date) IN (2023, 2024)
GROUP BY year
ORDER BY year;

-- TOAL AMOUNT BY GENDER
SELECT gender, SUM(total_amount) AS total_amount
FROM retail_sales
GROUP BY gender;

-- TOTAL CUSTOMER PER PRODUCT CATEGORY
SELECT product_category,
       COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
WHERE product_category IN ('Clothing', 'Electronics', 'Beauty')
GROUP BY product_category
ORDER BY product_category;

-- TOTAL CUSTOMER FROM AGE 20 AND ABOVE
SELECT age, COUNT(*) AS total_customers
FROM retail_sales
WHERE age >= 20
GROUP BY age
ORDER BY age;

-- TOTAL CUSTOMER FROM BELOW AGE 20
SELECT age, COUNT(*) AS total_customers
FROM retail_sales
WHERE age < 20
GROUP BY age
ORDER BY age;

-- TOTAL AMOUNT PER AGE
SELECT age, SUM(total_amount) AS total_amount_per_age
FROM retail_sales
GROUP BY age
ORDER BY age;

-- NUMBER OF QUANTITY BY PRODUCT CATEGORY AND TOTAL AMOUNT
SELECT quantity, product_category, COUNT(*) AS total_orders,
       SUM(total_amount) AS total_amount
FROM retail_sales
WHERE product_category IN ('Clothing', 'Electronics', 'Beauty')
GROUP BY quantity, product_category
ORDER BY quantity;

-- TOTAL AMOUNT EACH YEAR
SELECT EXTRACT(YEAR FROM date) AS year,
       SUM(total_amount) AS total_amount
FROM retail_sales
WHERE EXTRACT(YEAR FROM date) IN (2023, 2024)
GROUP BY year
ORDER BY year;
