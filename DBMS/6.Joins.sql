-- Joins 

SELECT * 
FROM employeedemographics;

SELECT *
FROM employeesalary;

SELECT dem.EmployeeID, Age, Salary
FROM employeedemographics AS dem
INNER JOIN employeesalary AS sal
	ON dem.EmployeeID=sal.EmployeeID
;

-- OUTER JOIN
SELECT *
FROM employeedemographics AS dem
LEFT JOIN employeesalary AS sal
	ON dem.EmployeeID=sal.EmployeeID
;

-- SELF JOIN

SELECT emp1.EmployeeID as emp_snata,
emp1.JobTitle as JT,
emp2.EmployeeID as emp_name,
emp2.JobTitle
FROM employeesalary AS emp1
JOIN employeesalary AS emp2
	ON emp1.EmployeeID + 1=emp2.EmployeeID
;
