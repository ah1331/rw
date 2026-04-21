# 📊 DAX Depo — Advanced Calculations Using DAX in Power BI


## 📋 Project Overview

This project, titled **"DAX Depo"**, was assigned by senior leadership to build a backend data model and perform **advanced analytical calculations using DAX** in Power BI.

The goal is to evaluate how well internal metrics, KPIs, and time-based insights can be generated using **DAX functions** — without relying on external visuals (except **Matrix tables** where absolutely necessary).

All calculated results are displayed in **Matrix visual only**, grouped by:
- Region
- Month
- Product Category
- Customer Segment

---

## 🗂️ Dataset Tables Used

| Table | Description |
|---|---|
| `Sales_Fact` | Core sales transactions data |
| `Returns_Fact` | Product return records |
| `Customer_Dim` | Customer dimension with names and segments |
| `Product_Dim` | Product details and categories |
| `Date_Dim` | Date dimension for time intelligence |
| `Region_Dim` | Regional breakdown for geographic analysis |

---

## ✅ Tasks Performed

### 1. 🧮 Calculated Columns

Three calculated columns were added directly to the tables:

**① Profit Column** — Added to `Sales_Fact`
```dax
Profit = Sales_Fact[SalesAmount] - Sales_Fact[Cost]
```

**② ReturnFlag Column** — Added to `Sales_Fact`
```dax
ReturnFlag = IF(Sales_Fact[IsReturned] = 1, "Returned", "Not Returned")
```

**③ Customer Full Name Column** — Added to `Customer_Dim`
```dax
Customer Full Name = Customer_Dim[FirstName] & " " & Customer_Dim[LastName]
```

---

### 2. 📐 Measures

Five core measures were created for key business metrics:

```dax
Total Sales = SUM(Sales_Fact[SalesAmount])

Total Cost = SUM(Sales_Fact[Cost])

Total Profit = SUM(Sales_Fact[Profit])

Return Rate = DIVIDE(COUNTROWS(Returns_Fact), COUNTROWS(Sales_Fact), 0)

Average Sale per Transaction = AVERAGE(Sales_Fact[SalesAmount])
```

---

### 3. ⚡ Quick Measures

Two Quick Measures were created using Power BI's built-in Quick Measure feature:

**① Year-Over-Year Sales Growth**


**② Current vs Previous Month Sales Difference**

---

### 4. 🗃️ Measure Management — Dedicated Measure Table

A **dedicated Measure Table** was created to organize all DAX measures clearly and keep the data model clean:

- Created an empty table named `All Measure` (using Enter Data)
- All measures were moved/created inside this table
- This keeps the model organized and professional

---

### 5. 🔍 Filter Context & Behavior

A Matrix table was used to compare **Sales by Region** with and without filters using:

**① ALL() — Removes filter context**
```dax
Total Sales (All Regions) = CALCULATE([Total Sales], ALL(Region_Dim))
```

**② FILTER() — Applies custom filter**
```dax
Sales (Filtered Region) = CALCULATE([Total Sales], FILTER(Region_Dim, Region_Dim[Region] = "North"))
```

**③ CALCULATE() — Modifies filter context**
```dax
Sales North = CALCULATE([Total Sales], Region_Dim[Region] = "North")
```

---

### 6. 🔣 DAX Operators and Functions Used

| Category | Functions Used |
|---|---|
| Math / Statistical | `SUM`, `AVERAGE`, `MAX` |
| Counting | `COUNTX`, `DISTINCTCOUNT` |
| Logical | `IF`, `AND`, `OR`, `SWITCH` |
| Text Manipulation | `CONCATENATE`, `UPPER`, `LEFT` |
| Date Handling | `YEAR`, `MONTH`, `EOMONTH` |



### 7. 🔗 Joining and Relationships — RELATED()

The `RELATED()` function was used to pull data from dimension tables into calculated columns in the fact tables:

```dax
-- In Sales_Fact: Pull Region Name from Region_Dim
Region Name = RELATED(Region_Dim[RegionName])

-- In Sales_Fact: Pull Product Category from Product_Dim
Product Category = RELATED(Product_Dim[Category])
```

---

### 8. 🕐 Time Intelligence (Matrix-based Analysis)

Time intelligence functions were applied and displayed in Matrix visuals:

**① TOTALYTD — Year-to-Date Sales**

**② SAMEPERIODLASTYEAR — Last Year Comparison**

**③ DATESINPERIOD — Rolling 3-Month Sales**

**④ Running Total using CALCULATE + DATESBETWEEN**

---

### 9. 🔀 Additional Scenarios

**① SWITCH() — Sales Range Categorization**
```dax
Sales Range = 
SWITCH(
    TRUE(),
    [Total Sales] < 1000, "Low",
    [Total Sales] < 5000, "Medium",
    "High"
)
```

**② SUMX — Iterator for aggregated metrics**
```dax
Total Revenue (SUMX) = SUMX(Sales_Fact, Sales_Fact[SalesAmount] * Sales_Fact[Quantity])
```

**③ AVERAGEX — Average profit per product**
```dax
Avg Profit per Product = AVERAGEX(Product_Dim, [Total Profit])
```

---

## 📤 Output

All results are displayed in **Matrix visuals only**, as per project requirements.  
No bar charts, line charts, pie charts, or other visuals were used.

Matrix tables are organized by:
- **Rows:** Region, Product Category, Customer Segment
- **Columns:** Month / Year
- **Values:** Various DAX measures (Sales, Profit, YTD, YoY, etc.)

---



