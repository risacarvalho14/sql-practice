--Qn 16) Create a single list showing customers from Toronto, combined with customers from Vancouver — just their name and city

SELECT name, city 
FROM customers
WHERE city = 'Toronto'
UNION
SELECT name, city 
FROM customers
WHERE city = 'Vancouver';