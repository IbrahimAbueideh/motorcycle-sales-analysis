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