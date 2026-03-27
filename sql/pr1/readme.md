# 🗄️ SQL PR-1
---

## 📌 Tables Overview

### 1. Customers Table

Stores customer information.

**Fields:**

* CustomerID
* Name
* Email
* Address

**Operations performed:**

* Insert sample data
* Update customer address
* Delete a customer
* Retrieve customer data

---

### 2. Orders Table

Stores order details.

**Fields:**

* OrderID
* CustomerID
* OrderDate
* TotalAmount

**Operations performed:**

* Fetch orders by CustomerID
* Update total amount
* Delete orders
* Filter recent orders (last 30 days)
* Aggregate functions (MAX, MIN, AVG)

---

### 3. Products Table

Stores product information.

**Fields:**

* ProductID
* ProductName
* Price
* Stock

**Operations performed:**

* Sort products by price
* Update product price
* Delete out-of-stock products
* Filter products by price range
* Find highest & lowest priced products

---

### 4. OrderDetails Table

Stores detailed order transactions.

**Fields:**

* OrderDetailID
* OrderID
* ProductID
* Quantity
* SubTotal

**Operations performed:**

* Fetch order details by OrderID
* Calculate total revenue (SUM)
* Top 3 products by quantity
* Count product-wise orders

---

## 🔍 Key SQL Concepts Used

* CRUD Operations (Create, Read, Update, Delete)
* Filtering (`WHERE`, `BETWEEN`)
* Sorting (`ORDER BY`)
* Aggregation (`SUM`, `COUNT`, `AVG`, `MAX`, `MIN`)
* Subqueries
* Grouping (`GROUP BY`)

---

