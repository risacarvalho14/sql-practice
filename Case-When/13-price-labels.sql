--Qn 13) Label each product as 'Budget', 'Mid-range', or 'Premium' based on price: under $50 = Budget, $50-$300 = Mid-range, above $300 = Premium.

SELECT *,
    CASE
        WHEN price < 50 THEN 'Budget'
        WHEN price BETWEEN 50 AND 300 THEN 'Mid-range'
        ELSE 'Premium'
    END AS price_label
FROM products;