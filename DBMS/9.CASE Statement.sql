-- CASE STATEMENT

SELECT FirstName, Age,
CASE 
	WHEN age<30 THEN 'YOUNG'
    WHEN age BETWEEN 30 AND 35 THEN 'OLD'
    WHEN age>35 THEN "on DEATH'S DOOR"
END AS Age_Bracket
FROM employeedemographics;

-- salary
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% bonus

SELECT Salary,
CASE
	WHEN Salary<50000 THEN Salary + (Salary*0.05)
    WHEN Salary>50000 THEN Salary + (Salary*0.07)
END AS New_Sal
FROM employeesalary;





