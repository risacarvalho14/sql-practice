--Qn 11) Show every products which are never ordered

SELECT p.id, p.name, o.id
FROM products p
LEFT JOIN orders o ON p.id = o.product_id
WHERE o.id IS NULL