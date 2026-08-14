--Qn8) Find customers who made a purchase in every month that has at least one order in the dataset

SELECT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT (DISTINCT FORMAT(CAST(o.order_date AS DATE), 'yyyy-MM')) = (
    SELECT COUNT (DISTINCT FORMAT(CAST(order_date AS DATE), 'yyyy-MM'))
    FROM orders
);