--Qn 15) Show each employee's name, salary, and a column saying whether they earn 'Above Average', 'Below Average', or 'Average' compared to the COMPANY-WIDE average salary (not per department)

SELECT name,salary,
    CASE
        WHEN salary > (Select avg(salary) from employees) THEN 'above avegrage'
        WHEN salary <(select avg(salary) from employees) THEN 'below average'
    ELSE 'average'
    END AS avg_distribution
FROM employees;
