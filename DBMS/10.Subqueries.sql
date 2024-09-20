-- Subqueries

Select *
From employee_demographics
WHERE EmployeeID IN 
				(SELECT EmployeeID
					FROM employee_salary
                    WHERE dept_id IN 
								(SELECT dept_id
									FROM departments)
                    )
;

-- avg
Select First_Name, Salary,
(Select avg(Salary)
FROM employee_salary)
FROM employee_salary;

Select avg(max_age)
FROM
(Select gender, 
avg(Age) as avg_age,
max(Age) as max_age,
min(Age) as min_age,
count(Age) as count_age
FROM employee_demographics
group by Gender) as Agg_table;

















