--Qn3) Find the top 3 highest-grossing product categories.
Select TOP 3 sum(amount) as total_amt, p.category
 from products p 
 INNER JOIN Orders o 
 on p.id = o.product_id 
 group by category 
 order by total_amt desc;