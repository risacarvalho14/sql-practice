-- Qn 10) For each customer, show every order along with the amount of their PREVIOUS order (so you can compare order-to-order changes)

SELECT c.name, o.amount, c.id,
       LAG(amount) OVER (PARTITION BY c.id ORDER BY o.order_date) AS prev_orders
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;