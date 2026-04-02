-- CREATE TABLE customers (
--     CustomerID INT PRIMARY KEY,
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Email VARCHAR(100),
--     RegistrationDate DATE
-- );

-- INSERT INTO customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
-- (1, 'Amit', 'Shah', 'amit@gmail.com', '2024-01-15'),
-- (2, 'Ravi', 'Patel', 'ravi@gmail.com', '2024-02-20'),
-- (3, 'Neha', 'Mehta', 'neha@gmail.com', '2024-03-10');

-- CREATE TABLE orders (
--     OrderID INT PRIMARY KEY,
--     CustomerID INT,
--     OrderDate DATE,
--     TotalAmount DECIMAL(10,2),
--     FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
-- );

-- INSERT INTO orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
-- (101, 1, '2024-03-01', 2500.50),
-- (102, 2, '2024-03-05', 1800.00),
-- (103, 1, '2024-03-10', 3200.75),
-- (104, 3, '2024-03-12', 1500.00);

-- CREATE TABLE employees (
--     EmployeeID INT PRIMARY KEY,
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Department VARCHAR(50),
--     HireDate DATE,
--     Salary DECIMAL(10,2)
-- );

-- INSERT INTO employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
-- (1, 'Raj', 'Verma', 'IT', '2022-01-15', 60000),
-- (2, 'Priya', 'Sharma', 'HR', '2021-07-10', 50000),
-- (3, 'Amit', 'Patel', 'Finance', '2020-03-25', 55000),
-- (4, 'Neha', 'Kapoor', 'IT', '2023-06-01', 65000),
-- (5, 'Karan', 'Mehta', 'Sales', '2019-11-20', 48000);

-- ========== 17 QUERIES ==========

-- 1. INNER JOIN: Retrieve all orders and customer details where orders exist
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate, o.TotalAmount
FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID;

-- 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate, o.TotalAmount
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate, o.TotalAmount
FROM customers c
RIGHT JOIN orders o ON c.CustomerID = o.CustomerID;

-- 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate, o.TotalAmount
FROM customers c
FULL OUTER JOIN orders o ON c.CustomerID = o.CustomerID;

-- 5. Subquery to find customers who have placed orders worth more than the average amount
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM orders);

-- 6. Subquery to find employees with salaries above the average salary
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM employees
WHERE Salary > (SELECT AVG(Salary) FROM employees);

-- 7. Extract the year and month from the OrderDate
SELECT OrderID, CustomerID, OrderDate, 
         YEAR(OrderDate) AS OrderYear, 
         MONTH(OrderDate) AS OrderMonth,
         TotalAmount
FROM orders;


-- 8. Calculate the difference in days between two dates (order date and current date)
SELECT OrderID, CustomerID, OrderDate, 
       DATEDIFF(DAY, OrderDate, GETDATE()) AS DaysSinceOrder, 
       TotalAmount
FROM orders;

-- 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY')
SELECT OrderID, CustomerID, 
       FORMAT(OrderDate, 'dd-MMM-yyyy') AS FormattedOrderDate, 
       TotalAmount
FROM orders;

-- 10. Concatenate FirstName and LastName to form a full name
SELECT CustomerID, 
       CONCAT(FirstName, ' ', LastName) AS FullName, 
       Email, 
       RegistrationDate
FROM customers;

-- 11. Replace part of a string (e.g., replace 'Amit' with 'Amitabh')
SELECT CustomerID, 
       REPLACE(FirstName, 'Amit', 'Amitabh') AS ModifiedFirstName, 
       LastName, 
       Email
FROM customers;

-- 12. Convert FirstName to uppercase and LastName to lowercase
SELECT CustomerID, 
       UPPER(FirstName) AS FirstNameUpper, 
       LOWER(LastName) AS LastNameLower, 
       Email
FROM customers;

-- 13. Trim extra spaces from the Email field
SELECT CustomerID, 
       FirstName, 
       LastName, 
       TRIM(Email) AS TrimmedEmail
FROM customers;

-- 14. Calculate the running total of TotalAmount for each order
SELECT OrderID, CustomerID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderID) AS RunningTotal
FROM orders;

-- 15. Rank orders based on TotalAmount using the RANK() function
SELECT OrderID, CustomerID, OrderDate, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
FROM orders;

-- 16. Assign a discount based on TotalAmount in orders (e.g., < 1000: 10% off, > 500: 5% off)
SELECT OrderID, CustomerID, OrderDate, TotalAmount,
       CASE 
           WHEN TotalAmount < 1000 THEN '10% off'
           WHEN TotalAmount >= 1000 AND TotalAmount < 2500 THEN '5% off'
           WHEN TotalAmount >= 2500 THEN 'No discount'
       END AS DiscountCategory
FROM orders;

-- 17. Categorize employees' salaries as high, medium, or low
SELECT EmployeeID, FirstName, LastName, Department, Salary,
       CASE 
           WHEN Salary >= 60000 THEN 'High'
           WHEN Salary >= 50000 AND Salary < 60000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM employees;
