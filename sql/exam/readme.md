# E-Commerce SQL Practice (Final)

This file contains SQL commands for a simple e-commerce database.

Main file: `final.pgsql`

## What is inside

The script has:

1. Table creation (`CREATE TABLE`)
2. Basic data operations (`INSERT`, `UPDATE`, `DELETE`)
3. Many `SELECT` queries for practice
4. Joins, subqueries, aggregate functions, date functions, and window functions

## Tables in this database

1. `Categories`
- Stores product category names

2. `Products`
- Stores product details like name, category, price, stock, and added date

3. `Customers`
- Stores customer info like name, email, phone, address, and registration date

4. `Orders`
- Stores order info like customer, date, amount, and order status

5. `Order_Items`
- Stores products inside each order with quantity and subtotal

6. `Payments`
- Stores payment method and payment status for each order

7. `Shipping`
- Stores shipping date, delivery date, and shipping status

## Main topics covered

- Create and link tables using foreign keys
- Update stock after placing an order
- Delete old cancelled orders
- Filter data with conditions (`AND`, `OR`, `NOT`)
- Sort data with `ORDER BY`
- Group data with `GROUP BY` and `HAVING`
- Use joins (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`)
- Use subqueries (`IN`, `NOT IN`)
- Use aggregate functions (`SUM`, `AVG`, `COUNT`)
- Use date and string functions (`MONTH`, `DATEDIFF`, `DATE_FORMAT`, `UPPER`, `TRIM`)
- Use window functions (`RANK`, running total, cumulative sum)
- Use `CASE` for labels like loyalty status

