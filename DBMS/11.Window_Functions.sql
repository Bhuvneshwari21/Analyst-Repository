-- window functions
-- over(partition by)
Select emp.First_Name, emp.Last_Name, gender, 
avg(Salary) as avg_sal
From employee_demographics as emp
JOIN employee_salary as sal
ON emp.EmployeeID=sal.EmployeeID
GROUP BY emp.First_Name, emp.Last_Name,Gender;

-- avg()
Select emp.First_Name, emp.Last_Name, gender, 
avg(Salary) OVER(partition by Gender)
From employee_demographics as emp
JOIN employee_salary as sal
ON emp.EmployeeID=sal.EmployeeID;

-- sum()
Select emp.First_Name, emp.Last_Name, gender, 
sum(Salary) OVER(partition by Gender)
From employee_demographics as emp
JOIN employee_salary as sal
ON emp.EmployeeID=sal.EmployeeID;

-- Rolling Total - order by
Select emp.First_Name, emp.Last_Name, gender, salary,
sum(Salary) OVER(partition by Gender order by emp.EmployeeID) as Rolling_Total
From employee_demographics as emp
JOIN employee_salary as sal
ON emp.EmployeeID=sal.EmployeeID;

-- ROW_NUMBER() - it gives the row number based on the over() function condition
select emp.EmployeeID,emp.First_Name, emp.Last_Name, gender, sal.Salary,
ROW_NUMBER() OVER(partition by Gender order by Salary DESC)
FROM employee_demographics as emp
JOIN employee_salary as sal
	ON emp.EmployeeID=sal.EmployeeID;

-- RANK() - it gives rank number based on over() function
-- difference b/w rank() and row_number() is that in case of similar values row give next number but rank give similar number
-- difference b/w dense_rank() and rank() is on case of similar values rank give next number as row number skipping the sequence of number
-- but dense rank go by sequence 

Select emp.First_Name, emp.Last_Name, sal.Salary, Gender,
ROW_NUMBER() OVER(Partition by Gender order by Salary DESC) as row_num,
RANK() OVER(partition by Gender order by Salary DESC) as rank_num,
DENSE_RANK() OVER(partition by Gender order by Salary DESC) as dense_rank_num
FROM employee_demographics as emp
JOIN employee_salary as sal
	ON emp.EmployeeID=sal.EmployeeID;



