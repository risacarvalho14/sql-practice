--Qn2) Find all customers who have never placed an order.
SELECT c.name, c.city
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;