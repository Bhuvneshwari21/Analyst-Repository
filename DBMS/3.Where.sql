-- WHERE Clause

SELECT *
FROM employeesalary
WHERE Salary<50000;

SELECT *
FROM employeedemographics
WHERE Gender!='Female';

-- AND OR NOT -- LOGICAL OPERATOR
SELECT *
FROM employeedemographics
WHERE FirstName = 'Pam' OR Gender='male';

-- LIKE STATEMENT 
SELECT * 
FROM employeedemographics
where FirstName LIKE 'a___%';