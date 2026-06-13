-- -- Total Orders
-- select count(*) as Total_Orders from orders;

-- -- Total customers
-- select count(*) as Total_Customers from customers;

-- -- total products
-- select count(*) as Total_Products from products;

-- -- most frequent ordered products
-- select p.product_name, count(*) as order_count
-- from order_items oi
-- join products p on oi.product_id = p.product_id
-- group by p.product_name
-- order by order_count desc
-- limit 10;

-- -- average order value
-- select avg(total_order_value) as Average_Order_Value from (select sum(oi.quantity * p.unit_price) as total_order_value from orders o 
-- join order_items oi on o.order_id = oi.order_id
-- join products p on oi.product_id = p.product_id
-- group by o.order_id) as order_values;

-- revenue over time
-- SELECT
--     DATE_TRUNC('month', o.order_date::timestamp) AS month,
--     SUM(oi.quantity * p.unit_price) AS monthly_revenue
-- FROM orders o
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY DATE_TRUNC('month', o.order_date::timestamp)
-- ORDER BY month;

-- -- top 5 states by revenue
-- SELECT
--     c.state,
--     SUM(oi.quantity * p.unit_price) AS total_revenue
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY c.state
-- ORDER BY total_revenue DESC
-- LIMIT 5;

-- new vs returning customers monthly
-- SELECT
--     DATE_TRUNC('month', o.order_date::timestamp) AS month,
--     COUNT(DISTINCT CASE
--         WHEN DATE_TRUNC('month', c.registration_date::timestamp) = DATE_TRUNC('month', o.order_date::timestamp)
--         THEN c.customer_id
--     END) AS new_customers,
--     COUNT(DISTINCT CASE
--         WHEN DATE_TRUNC('month', c.registration_date::timestamp) < DATE_TRUNC('month', o.order_date::timestamp)
--         THEN c.customer_id
--     END) AS returning_customers
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- GROUP BY DATE_TRUNC('month', o.order_date::timestamp)
-- ORDER BY month;

-- -- top 5 customers by revenue
-- SELECT
--     c.customer_id,
--     c.first_name,
--     c.last_name,
--     SUM(oi.quantity * p.unit_price) AS total_revenue
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY total_revenue DESC
-- LIMIT 5;

-- -- gender wise spending distribution
-- SELECT 
--     c.gender,
--     SUM(oi.quantity * p.unit_price) AS total_spending
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY c.gender
-- ORDER BY total_spending DESC;

-- churn prediction using last order_date
-- SELECT
--     c.customer_id,
--     c.first_name,
--     c.last_name,
--     MAX(o.order_date) AS last_order_date,
--     CASE
--         WHEN MAX(o.order_date::timestamp) < CURRENT_DATE - INTERVAL '6 months' THEN 'Churned'
--         ELSE 'Active'
--     END AS customer_status
-- FROM customers c
-- LEFT JOIN orders o ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY last_order_date DESC;

-- best selling products by quantity and revenue
-- SELECT
--     p.product_name,
--     SUM(oi.quantity) AS total_quantity_sold,
--     SUM(oi.quantity * p.unit_price) AS total_revenue
-- FROM products p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- GROUP BY p.product_name
-- ORDER BY total_revenue DESC LIMIT 10;

-- -- product category wise revenue distribution
-- SELECT
--     p.category,
--     SUM(oi.quantity * p.unit_price) AS total_revenue
-- FROM products p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- GROUP BY p.category
-- ORDER BY total_revenue DESC;

-- profit margin analysis (unit price - cost price)
-- SELECT
--     p.product_name,
--     SUM(oi.quantity * (p.unit_price - p.cost_price)) AS total_profit
-- FROM products p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- GROUP BY p.product_name
-- ORDER BY total_profit DESC LIMIT 10;

-- -- identify underperforming products (low sales and high inventory)
-- SELECT
--     p.product_name,
--     SUM(oi.quantity) AS total_quantity_sold
-- FROM products p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- GROUP BY p.product_name
-- HAVING SUM(oi.quantity) < 500 
-- ORDER BY total_quantity_sold ASC;

-- average shipping time
-- SELECT                  
--   EXTRACT(EPOCH FROM AVG(s.shipping_date::timestamp - o.order_date::timestamp)) / 86400.0 AS avg_days
-- FROM orders o
-- JOIN shipping s ON o.order_id = s.order_id
-- WHERE s.shipping_date IS NOT NULL
--   AND s.shipping_date::timestamp >= o.order_date::timestamp;


-- shipping cost analysis
-- SELECT
--     s.shipping_method,
--     AVG(s.shipping_cost) AS average_shipping_cost
-- FROM shipping s
-- GROUP BY s.shipping_method
-- ORDER BY average_shipping_cost DESC;

-- delayed vs on-time deliveries pattern
-- SELECT
--     s.shipping_method,
--     COUNT(*) AS total_shipments,
--     SUM(CASE WHEN s.shipping_date::timestamp > o.order_date::timestamp + INTERVAL '5 days' THEN 1 ELSE 0 END) AS delayed_shipments,
--     SUM(CASE WHEN s.shipping_date::timestamp <= o.order_date::timestamp + INTERVAL '5 days' THEN 1 ELSE 0 END) AS on_time_shipments
-- FROM shipping s
-- JOIN orders o ON s.order_id = o.order_id
-- WHERE s.shipping_date IS NOT NULL
-- GROUP BY s.shipping_method
-- ORDER BY total_shipments DESC;