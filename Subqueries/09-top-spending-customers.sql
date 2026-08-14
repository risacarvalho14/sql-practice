--Qn9) Find the customer(s) who spent the most money overall (total across all their orders).

select TOP 1 c.name,c.id,sum(amount) AS total_amount
FROM orders o
INNER JOIN customers c
ON c.id = o.customer_id
GROUP BY c.name,c.id
ORDER BY total_amount DESC;