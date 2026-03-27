-- 1.
CREATE TABLE customers (
    CustomerID INT,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(150)
);

INSERT INTO customers (CustomerID, Name, Email, Address) VALUES
(1, 'Amit Shah', 'amit@gmail.com', 'Ahmedabad, Gujarat'),
(2, 'Ravi Patel', 'ravi@gmail.com', 'Surat, Gujarat'),
(3, 'Neha Mehta', 'neha@gmail.com', 'Vadodara, Gujarat'),
(4, 'Priya Desai', 'priya@gmail.com', 'Rajkot, Gujarat'),
(5, 'Karan Joshi', 'karan@gmail.com', 'Mumbai, Maharashtra');

SELECT * from customers
update customers set address='Ahmedabad' where customerid=1
delete from customers where customerid=2
select * from customers where name='Alice'
--------------------------------------------------------------------------------------------------------
-- 2.
CREATE TABLE orders (
    OrderID INT ,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT
);

INSERT INTO orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(201, 1, '2024-01-10', 2500),
(202, 2, '2024-01-12', 1800),
(203, 3, '2024-01-15', 3200),
(204, 4, '2024-01-18', 1500),
(205, 5, '2024-01-20', 2700);

SELECT * from orders where CustomerID=1
update orders set totalamount=11111 where customerid=1
delete from orders where orderid=201
select * from orders where orderdate> (current_date - interval '30 days')
select max(totalamount),min(totalamount),avg(totalamount) from orders
--------------------------------------------------------------------------------------------------------
-- 3.
CREATE TABLE products (
    ProductID INT ,
    ProductName VARCHAR(50),
    Price INT,
    Stock INT
);
INSERT INTO products (ProductID, ProductName, Price, Stock) VALUES
(301, 'Laptop', 55000, 10),
(302, 'Mobile', 20000, 25),
(303, 'Keyboard', 1500, 50),
(304, 'Mouse', 800, 60),
(305, 'Monitor', 12000, 15)

SELECT * from products order by price desc
update products set price=75000 where productname='Laptop'
delete from products where stock=0
select * from products where price between 500 and 2000
select productname,price from products where price=(select max(price) from products)
select productname,price from products where price=(select min(price) from products)
--------------------------------------------------------------------------------------------------------
-- 4.
CREATE TABLE orderdetails (
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal INT
);

INSERT INTO orderdetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(401, 201, 301, 1, 55000),
(402, 202, 302, 2, 40000),
(403, 203, 303, 3, 4500),
(404, 204, 304, 2, 1600),
(405, 205, 305, 1, 12000);

SELECT * from orderdetails where orderid=201
select sum(subtotal) from orderdetails
SELECT * FROM orderdetails ORDER BY Quantity DESC LIMIT 3;
SELECT count(*) from orderdetails GROUP by productid
