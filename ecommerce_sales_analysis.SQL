-- ============================================
-- E-COMMERCE SALES ANALYTICS PROJECT
-- DATABASE TABLES
-- ============================================

-- 1. Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);


-- 2. Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);


-- 3. Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    order_status VARCHAR(30)
);


-- 4. Order Items Table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2)
);


-- 5. Payments Table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2)
);


-- ============================================
-- INSERT CUSTOMERS
-- ============================================

INSERT INTO customers
(customer_name, email, city, state, signup_date)
VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Delhi', 'Delhi', '2025-01-10'),
('Aman Kumar', 'aman@gmail.com', 'Patna', 'Bihar', '2025-01-15'),
('Priya Singh', 'priya@gmail.com', 'Mumbai', 'Maharashtra', '2025-02-05'),
('Neha Verma', 'neha@gmail.com', 'Bangalore', 'Karnataka', '2025-02-12'),
('Arjun Patel', 'arjun@gmail.com', 'Ahmedabad', 'Gujarat', '2025-03-01'),
('Riya Gupta', 'riya@gmail.com', 'Lucknow', 'Uttar Pradesh', '2025-03-18'),
('Vikas Yadav', 'vikas@gmail.com', 'Noida', 'Uttar Pradesh', '2025-04-02'),
('Sneha Roy', 'sneha@gmail.com', 'Kolkata', 'West Bengal', '2025-04-15'),
('Karan Mehta', 'karan@gmail.com', 'Pune', 'Maharashtra', '2025-05-01'),
('Anjali Singh', 'anjali@gmail.com', 'Jaipur', 'Rajasthan', '2025-05-20'),
('Rohit Das', 'rohit@gmail.com', 'Chennai', 'Tamil Nadu', '2025-06-05'),
('Pooja Sharma', 'pooja@gmail.com', 'Hyderabad', 'Telangana', '2025-06-15'),
('Aditya Jain', 'aditya@gmail.com', 'Delhi', 'Delhi', '2025-07-01'),
('Simran Kaur', 'simran@gmail.com', 'Chandigarh', 'Chandigarh', '2025-07-10'),
('Manish Kumar', 'manish@gmail.com', 'Ranchi', 'Jharkhand', '2025-08-01');


-- ============================================
-- INSERT PRODUCTS
-- ============================================

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Laptop', 'Electronics', 55000, 25),
('Smartphone', 'Electronics', 25000, 40),
('Headphones', 'Electronics', 2500, 100),
('Keyboard', 'Electronics', 1500, 80),
('Mouse', 'Electronics', 800, 120),
('Monitor', 'Electronics', 12000, 30),
('T-Shirt', 'Fashion', 799, 150),
('Jeans', 'Fashion', 1499, 100),
('Running Shoes', 'Fashion', 2999, 70),
('Backpack', 'Fashion', 1299, 90),
('Coffee Maker', 'Home Appliances', 4500, 40),
('Mixer Grinder', 'Home Appliances', 3500, 50),
('Air Fryer', 'Home Appliances', 6000, 35),
('Table Lamp', 'Home Decor', 1200, 60),
('Bookshelf', 'Home Decor', 5500, 20);


-- ============================================
-- INSERT ORDERS
-- ============================================

INSERT INTO orders
(customer_id, order_date, order_status)
VALUES
(1, '2025-01-20', 'Delivered'),
(2, '2025-01-25', 'Delivered'),
(3, '2025-02-10', 'Delivered'),
(4, '2025-02-18', 'Delivered'),
(5, '2025-03-05', 'Delivered'),
(6, '2025-03-20', 'Cancelled'),
(7, '2025-04-10', 'Delivered'),
(8, '2025-04-20', 'Delivered'),
(9, '2025-05-05', 'Delivered'),
(10, '2025-05-25', 'Delivered'),
(11, '2025-06-10', 'Delivered'),
(12, '2025-06-20', 'Delivered'),
(13, '2025-07-05', 'Delivered'),
(14, '2025-07-15', 'Delivered'),
(15, '2025-08-05', 'Delivered'),
(1, '2025-08-15', 'Delivered'),
(2, '2025-08-20', 'Delivered'),
(3, '2025-08-25', 'Delivered'),
(4, '2025-09-05', 'Delivered'),
(5, '2025-09-10', 'Delivered');


-- ============================================
-- INSERT ORDER ITEMS
-- ============================================

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 55000),
(1, 3, 2, 2500),

(2, 2, 1, 25000),
(2, 5, 2, 800),

(3, 7, 3, 799),
(3, 8, 1, 1499),

(4, 6, 1, 12000),
(4, 3, 1, 2500),

(5, 9, 1, 2999),
(5, 10, 1, 1299),

(6, 4, 2, 1500),

(7, 11, 1, 4500),
(7, 14, 2, 1200),

(8, 12, 1, 3500),
(8, 15, 1, 5500),

(9, 1, 1, 55000),

(10, 2, 1, 25000),
(10, 3, 1, 2500),

(11, 13, 1, 6000),
(11, 5, 2, 800),

(12, 9, 2, 2999),

(13, 6, 2, 12000),

(14, 7, 2, 799),
(14, 8, 2, 1499),

(15, 11, 1, 4500),

(16, 2, 1, 25000),
(16, 4, 1, 1500),

(17, 1, 1, 55000),

(18, 12, 2, 3500),

(19, 3, 3, 2500),

(20, 10, 2, 1299);



-- ============================================
-- INSERT PAYMENTS
-- ============================================

INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1, '2025-01-20', 'UPI', 'Paid', 60000),
(2, '2025-01-25', 'Credit Card', 'Paid', 26600),
(3, '2025-02-10', 'UPI', 'Paid', 3896),
(4, '2025-02-18', 'Debit Card', 'Paid', 14500),
(5, '2025-03-05', 'UPI', 'Paid', 4298),
(6, '2025-03-20', 'UPI', 'Refunded', 3000),
(7, '2025-04-10', 'Credit Card', 'Paid', 6900),
(8, '2025-04-20', 'UPI', 'Paid', 9000),
(9, '2025-05-05', 'Credit Card', 'Paid', 55000),
(10, '2025-05-25', 'UPI', 'Paid', 27500),
(11, '2025-06-10', 'Debit Card', 'Paid', 7600),
(12, '2025-06-20', 'UPI', 'Paid', 5998),
(13, '2025-07-05', 'Credit Card', 'Paid', 24000),
(14, '2025-07-15', 'UPI', 'Paid', 4596),
(15, '2025-08-05', 'UPI', 'Paid', 4500),
(16, '2025-08-15', 'Credit Card', 'Paid', 26500),
(17, '2025-08-20', 'UPI', 'Paid', 55000),
(18, '2025-08-25', 'Debit Card', 'Paid', 7000),
(19, '2025-09-05', 'UPI', 'Paid', 7500),
(20, '2025-09-10', 'Credit Card', 'Paid', 2598);


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;










-- ============================================================
-- E-COMMERCE SALES & CUSTOMER ANALYTICS PROJECT
-- PostgreSQL / pgAdmin
-- 32 SQL ANALYSIS QUERIES
-- ============================================================


-- ============================================================
-- 1. TOTAL CUSTOMERS
-- ============================================================

SELECT COUNT(*) AS total_customers
FROM customers;


-- ============================================================
-- 2. TOTAL PRODUCTS
-- ============================================================

SELECT COUNT(*) AS total_products
FROM products;


-- ============================================================
-- 3. TOTAL ORDERS
-- ============================================================

SELECT COUNT(*) AS total_orders
FROM orders;


-- ============================================================
-- 4. DELIVERED ORDERS
-- ============================================================

SELECT COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'Delivered';


-- ============================================================
-- 5. CANCELLED ORDERS
-- ============================================================

SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';


-- ============================================================
-- 6. TOTAL REVENUE
-- ============================================================

SELECT ROUND(SUM(amount), 2) AS total_revenue
FROM payments
WHERE payment_status = 'Paid';


-- ============================================================
-- 7. AVERAGE ORDER VALUE
-- ============================================================

SELECT ROUND(AVG(amount), 2) AS average_order_value
FROM payments
WHERE payment_status = 'Paid';


-- ============================================================
-- 8. TOTAL QUANTITY SOLD
-- ============================================================

SELECT SUM(quantity) AS total_quantity_sold
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered';


-- ============================================================
-- 9. CUSTOMER-WISE SPENDING
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;


-- ============================================================
-- 10. TOP 5 CUSTOMERS
-- ============================================================

SELECT
    c.customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- ============================================================
-- 11. CUSTOMERS WHO ORDERED MORE THAN ONCE
-- ============================================================

SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;


-- ============================================================
-- 12. CUSTOMERS WITH NO ORDERS
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- ============================================================
-- 13. PRODUCT-WISE SALES
-- ============================================================

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;


-- ============================================================
-- 14. TOP 5 PRODUCTS
-- ============================================================

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;


-- ============================================================
-- 15. CATEGORY-WISE REVENUE
-- ============================================================

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;


-- ============================================================
-- 16. MOST EXPENSIVE PRODUCTS
-- ============================================================

SELECT
    product_name,
    category,
    price
FROM products
ORDER BY price DESC
LIMIT 5;


-- ============================================================
-- 17. PRODUCTS WITH LOW STOCK
-- ============================================================

SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 50
ORDER BY stock_quantity;


-- ============================================================
-- 18. MONTHLY REVENUE
-- ============================================================

SELECT
    DATE_TRUNC('month', p.payment_date)::DATE AS month,
    ROUND(SUM(p.amount), 2) AS revenue
FROM payments p
WHERE p.payment_status = 'Paid'
GROUP BY month
ORDER BY month;


-- ============================================================
-- 19. MONTHLY ORDERS
-- ============================================================

SELECT
    DATE_TRUNC('month', order_date)::DATE AS month,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;


-- ============================================================
-- 20. DAILY SALES
-- ============================================================

SELECT
    p.payment_date,
    ROUND(SUM(p.amount), 2) AS daily_revenue
FROM payments p
WHERE p.payment_status = 'Paid'
GROUP BY p.payment_date
ORDER BY p.payment_date;


-- ============================================================
-- 21. STATE-WISE CUSTOMERS
-- ============================================================

SELECT
    state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;


-- ============================================================
-- 22. CITY-WISE REVENUE
-- ============================================================

SELECT
    c.city,
    ROUND(SUM(p.amount), 2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.city
ORDER BY revenue DESC;


-- ============================================================
-- 23. PAYMENT METHOD PERFORMANCE
-- ============================================================

SELECT
    payment_method,
    COUNT(*) AS transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_amount DESC;


-- ============================================================
-- 24. PAYMENT STATUS ANALYSIS
-- ============================================================

SELECT
    payment_status,
    COUNT(*) AS transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC;


-- ============================================================
-- 25. CUSTOMER SEGMENTATION
-- ============================================================

SELECT
    c.customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent,
    CASE
        WHEN SUM(p.amount) >= 50000 THEN 'High Value'
        WHEN SUM(p.amount) >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_name
ORDER BY total_spent DESC;


-- ============================================================
-- 26. PRODUCTS ABOVE AVERAGE PRICE
-- ============================================================

SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;


-- ============================================================
-- 27. TOP CUSTOMERS USING CTE
-- ============================================================

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(p.amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Paid'
    GROUP BY c.customer_id, c.customer_name
)

SELECT
    customer_name,
    ROUND(total_spent, 2) AS total_spent
FROM customer_sales
WHERE total_spent > 20000
ORDER BY total_spent DESC;


-- ============================================================
-- 28. RANK CUSTOMERS BY SPENDING
-- ============================================================

SELECT
    customer_name,
    total_spent,
    RANK() OVER (
        ORDER BY total_spent DESC
    ) AS customer_rank
FROM (
    SELECT
        c.customer_name,
        SUM(p.amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Paid'
    GROUP BY c.customer_name
) AS customer_sales
ORDER BY customer_rank;


-- ============================================================
-- 29. RANK PRODUCTS BY REVENUE
-- ============================================================

SELECT
    product_name,
    revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS product_rank
FROM (
    SELECT
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_name
) AS product_sales
ORDER BY product_rank;


-- ============================================================
-- 30. CUMULATIVE REVENUE
-- ============================================================

SELECT
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date
    ) AS cumulative_revenue
FROM payments
WHERE payment_status = 'Paid'
ORDER BY payment_date;


-- ============================================================
-- 31. MONTHLY REVENUE + PREVIOUS MONTH
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', payment_date)::DATE AS month,
        SUM(amount) AS revenue
    FROM payments
    WHERE payment_status = 'Paid'
    GROUP BY month
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        LAG(revenue) OVER (
            ORDER BY month
        ),
        2
    ) AS previous_month_revenue
FROM monthly_sales
ORDER BY month;


-- ============================================================
-- 32. MONTH-OVER-MONTH GROWTH %
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', payment_date)::DATE AS month,
        SUM(amount) AS revenue
    FROM payments
    WHERE payment_status = 'Paid'
    GROUP BY month
),

sales_with_previous AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY month
        ) AS previous_revenue
    FROM monthly_sales
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(previous_revenue, 2) AS previous_revenue,
    ROUND(
        (
            (revenue - previous_revenue)
            / NULLIF(previous_revenue, 0)
        ) * 100,
        2
    ) AS growth_percentage
FROM sales_with_previous
ORDER BY month;


-- ============================================================
-- PROJECT COMPLETED
-- ============================================================
