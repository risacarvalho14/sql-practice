--Qn17) Create a single combined list of: (1) all customers who placed at least one order over $500, and (2) all employees in the 'Engineering' department. Show just a 'name' column and a 'source' column that says either 'Big Spender' or 'Engineer' depending on which group they came from.

USE practice;
GO

SELECT DISTINCT c.name, 'Big Spender' AS source
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.amount > 500

UNION ALL

SELECT e.name, 'Engineer' AS source
FROM employees e
WHERE e.department = 'Engineering';