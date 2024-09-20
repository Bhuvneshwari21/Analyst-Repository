-- HAVING VS WHERE

SELECT avg(Age), Gender
FROM employeedemographics
GROUP BY Gender
HAVING avg(Age)>10;

SELECT *
FROM employeesalary;