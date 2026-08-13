--Qn6) Find each customer's first and most recent order date

SELECT MIN(o.order_date) AS MIN_ORDER_DATE,MAX(o.order_date) AS MAX_ORDER_DATE,o.customer_id,c.name 
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
GROUP BY o.customer_id,c.name
ORDER BY MIN_ORDER_DATE;