# Analyzing Motorcycle Part Sales (SQL Data Analytics Portfolio)

## 📌 Project Overview
This project focuses on analyzing wholesale net revenue for a motorcycle parts distributor across multiple warehouse sites over a specific timeframe (June - August). The goal is to derive actionable business insights regarding product line performance, monthly revenue trends, and warehouse efficiency to support data-driven decision-making.

## 🛠️ Skills & Technologies Demonstrated
* **Advanced SQL Queries:** Window Functions, Case Statements, Conditional Aggregations.
* **Data Transformation & Cleaning:** Extracting dates, casting data types, handling granular business logic.
* **Analytical Metrics:** Calculating net revenue by subtracting transaction overheads (`SUM(total) - SUM(payment_fee)`).

## 🗂️ Dataset Structure
The analysis was performed on the `sales` dataset containing:
* `product_line`: Type of product ordered.
* `date`: Order date (June, July, August).
* `warehouse`: Warehouse location (`North`, `Central`, `West`).
* `client_type`: Customer segment (`Wholesale` vs `Retail`).
* `total`: Gross price of the order.
* `payment_fee`: Percentage/Fee charged as a result of the payment method.

## 💻 The SQL Solution
```sql
SELECT 
    product_line,
    CASE 
        WHEN date_part('month', date) = 6 THEN 'June'
        WHEN date_part('month', date) = 7 THEN 'July'
        WHEN date_part('month', date) = 8 THEN 'August'
    END AS month,
    warehouse,
    SUM(total) - SUM(payment_fee) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line ASC, month ASC, net_revenue DESC;