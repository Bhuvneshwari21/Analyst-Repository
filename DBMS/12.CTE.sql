-- CTEs - A Common Table Expression (CTE) in SQL is a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. 
-- CTEs are defined using the WITH keyword and allow you to create a named, reusable subquery within your SQL statement. 

WITH CTE_Example as
(
SELECT Gender, avg(Salary) avg_sal, max(Salary) max_sal, min(Salary) min_sal, count(Salary) count_sal
FROM employee_demographics as emp
JOIN employee_salary as sal
	ON emp.EmployeeID=sal.EmployeeID
group by Gender
)
Select avg(avg_sal)
FROM CTE_Example;

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) as
(
SELECT Gender, avg(Salary) avg_sal, max(Salary) max_sal, min(Salary) min_sal, count(Salary) count_sal
FROM employee_demographics as emp
JOIN employee_salary as sal
	ON emp.EmployeeID=sal.EmployeeID
group by Gender
)
Select *
FROM CTE_Example;


-- subquery for same
SELECT avg(avg_sal)
FROM (
SELECT Gender, avg(Salary) avg_sal, max(Salary) max_sal, min(Salary) min_sal, count(Salary) count_sal
FROM employee_demographics as emp
JOIN employee_salary as sal
	ON emp.EmployeeID=sal.EmployeeID
group by Gender)
example_subquery;


--------------------- 
WITH CTE_Example AS
(
Select EmployeeID, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 as
(
Select EmployeeID, Salary
FROM employee_salary
WHERE Salary>50000
)
Select *
FROM CTE_Example
JOIN CTE_Example2
	on CTE_Example.EmployeeID=CTE_Example2.EmployeeID;