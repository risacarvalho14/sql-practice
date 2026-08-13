--Qn4) Rank employees by salary within each department
select e.name,e.id,e.department,e.salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) as emp_standing
FROM employees e
ORDER BY salary DESC;