--Qn14) For each order, label it as 'Small', 'Medium', or 'Large' based on amount: under $50 = Small, $50–$500 = Medium, above $500 = Large.

SELECT *, 
CASE
    WHEN amount < 50 THEN 'SMALL'
    WHEN amount BETWEEN 50 AND 500 THEN 'Medium'
    ELSE 'Large'
    END AS order_size
FROM orders;