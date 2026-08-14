--Qn12) For each product category, find the single most expensive product — show ALL its columns (id, name, price), not just the max price

SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rn
    FROM products
) AS ranked
WHERE rn = 1;