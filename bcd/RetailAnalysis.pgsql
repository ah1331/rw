-- total sales amount per region for the last quarter
SELECT region, SUM(totalamount) AS total_sales
FROM retailtransactions
WHERE date >= DATE_TRUNC('quarter', CURRENT_DATE) - INTERVAL '3 months'
GROUP BY region
ORDER BY total_sales DESC;

-- top 5 best-selling products by revenue 
select productname, SUM(totalamount) AS revenue
from retailtransactions
group by productname
order by revenue desc
limit 5;

-- monthly sales trend across all regions 
SELECT DATE_TRUNC('month', date) AS month, SUM(totalamount) AS total_sales
FROM retailtransactions 
GROUP BY month
ORDER BY month;

-- region wise contribution to total sales (as %)
SELECT region, SUM(totalamount) AS region_sales,
         (SUM(totalamount) / (SELECT SUM(totalamount) FROM retailtransactions)) * 100 AS sales_percentage
FROM retailtransactions
GROUP BY region
ORDER BY sales_percentage DESC;

-- compare Online vs Offline sales across all months
SELECT DATE_TRUNC('month', date) AS month,
       SUM(CASE WHEN saleschannel = 'Online' THEN totalamount ELSE 0 END) AS online_sales,
       SUM(CASE WHEN saleschannel = 'Offline' THEN totalamount ELSE 0 END) AS offline_sales
FROM retailtransactions
GROUP BY month
ORDER BY month;

-- sales trend by category - which category are rising / falling 
SELECT DATE_TRUNC('month', date) AS month, category, SUM(totalamount) AS total_sales
FROM retailtransactions
GROUP BY month, category
ORDER BY month, total_sales DESC;

-- list customers who purchased more than 10 times
SELECT customerid, COUNT(*) AS purchase_count
FROM retailtransactions
GROUP BY customerid
HAVING COUNT(*) > 10
ORDER BY purchase_count DESC;