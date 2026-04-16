-- 1. Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT,
    registration_date DATE
);

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method ENUM('Credit Card', 'PayPal', 'UPI'),
    payment_status ENUM('Paid', 'Pending', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 7. Shipping Table
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status ENUM('Dispatched', 'In Transit', 'Delivered'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


-- 1. INSERT (Create)

-- Insert Category
INSERT INTO Categories (category_name)
VALUES ('Electronics');

-- Insert Product
INSERT INTO Products (name, category_id, price, stock_quantity, added_date)
VALUES ('Laptop', 1, 133110.00, 10, CURDATE());

-- Insert Customer
INSERT INTO Customers (name, email, phone_number, address, registration_date)
VALUES ('Ansh', 'ansh@email.com', '9876543210', 'Ahmedabad', CURDATE());

-- Insert Order
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES (1, CURDATE(), 133110.00, 'Pending');

-- 2. UPDATE (Stock update when order placed)

UPDATE Products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

-- 3. DELETE (Orders cancelled > 30 days ago)

DELETE FROM Orders
WHERE status = 'Cancelled'
AND order_date < CURDATE() - INTERVAL 30 DAY;

-- Orders in last 6 months
SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 6 MONTH;

-- Top 5 highest-priced products
SELECT * FROM Products
ORDER BY price DESC
LIMIT 5;

-- Customers with more than 3 orders
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;


-- Orders where status = Pending AND payment_status = Paid
SELECT o.*
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
WHERE o.status = 'Pending' AND p.payment_status = 'Paid';

-- Products NOT out of stock
SELECT * FROM Products
WHERE NOT stock_quantity = 0;

-- Customers registered after 2022 OR high purchase (>50000)
SELECT c.*
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.registration_date > '2022-12-31'
   OR o.total_amount > 50000;

-- Products sorted by price (DESC)
SELECT * FROM Products
ORDER BY price DESC;

-- Number of orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id;

-- Total revenue per category
SELECT p.category_id, SUM(oi.subtotal) AS revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category_id;

-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE status = 'Delivered';

-- Most purchased product
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

-- Average order value
SELECT AVG(total_amount) AS avg_order_value
FROM Orders;   

-- Orders → Customers
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)

-- Order_Items → Orders & Products
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
FOREIGN KEY (product_id) REFERENCES Products(product_id)

-- Payments → Orders
FOREIGN KEY (order_id) REFERENCES Orders(order_id)

-- Products with category names (INNER JOIN)
SELECT p.name, c.category_name
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id;

-- Orders with customer details (LEFT JOIN)
SELECT o.*, c.name, c.email
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- Orders not shipped (RIGHT JOIN alternative)
SELECT o.*
FROM Shipping s
RIGHT JOIN Orders o ON s.order_id = o.order_id
WHERE s.shipping_id IS NULL;

-- Customers who never ordered (FULL OUTER JOIN alternative)
SELECT c.*
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Orders by customers registered after 2022
SELECT *
FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE registration_date > '2022-12-31'
);

-- Customer who spent the most
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- Products never ordered
SELECT *
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM Order_Items
);

-- Orders per month
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date);

-- Delivery time (days)
SELECT order_id, DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM Shipping;

-- Format date
SELECT DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM Orders;

-- Uppercase product names
SELECT UPPER(name) FROM Products;

-- Trim customer names
SELECT TRIM(name) FROM Customers;

-- Replace missing emails
SELECT name, COALESCE(email, 'Not Provided') FROM Customers;

-- Rank customers by spending
SELECT customer_id,
       SUM(total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank
FROM Orders
GROUP BY customer_id;

-- Cumulative revenue per month
SELECT MONTH(order_date) AS month,
       SUM(total_amount),
       SUM(SUM(total_amount)) OVER (ORDER BY MONTH(order_date)) AS cumulative_revenue
FROM Orders
GROUP BY MONTH(order_date);

-- Running total of orders
SELECT order_id,
       COUNT(*) OVER (ORDER BY order_date) AS running_orders
FROM Orders;

-- Loyalty status
SELECT customer_id,
       SUM(total_amount) AS total_spent,
       CASE
           WHEN SUM(total_amount) > 50000 THEN 'Gold'
           WHEN SUM(total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS loyalty_status
FROM Orders
GROUP BY customer_id;

-- Product category by sales
SELECT product_id,
       SUM(quantity) AS total_sold,
       CASE
           WHEN SUM(quantity) > 500 THEN 'Best Seller'
           WHEN SUM(quantity) BETWEEN 200 AND 500 THEN 'Popular'
           ELSE 'Regular'
       END AS product_category
FROM Order_Items
GROUP BY product_id;