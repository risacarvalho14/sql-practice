--Qn5) Calculate a running total of daily sales
SELECT *, 
       SUM(total_sales) OVER (ORDER BY order_date) AS running_total
FROM (
    SELECT order_date, SUM(amount) AS total_sales
    FROM orders
    GROUP BY order_date
) AS daily_sales
ORDER BY order_date;