-- GROUP BY AND ORDER BY
-- this slected col should match with GROUP BY col name if not performing the aggregate function

SELECT Gender
FROM employeedemographics
GROUP BY Gender;

SELECT JobTitle, Salary
FROM employeesalary
group by JobTitle, Salary;

SELECT Gender, avg(Age), max(Age), min(Age), count(Age)
FROM employeedemographics
GROUP BY Gender;

-- ORDER BY 
SELECT *
FROM employeedemographics
order by Gender, Age DESC;

SELECT *
FROM employeedemographics
order by 5, 4 DESC;
