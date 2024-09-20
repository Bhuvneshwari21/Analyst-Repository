-- stored procedure -- prepared sql code that we can save so the code can be reused over and over again
CALL large_Salaries();

CREATE PROCEDURE large_Salaries()
Select *
from employee_salary
where salary>=50000;

CREATE PROCEDURE large_salaries2()
Select *
FROM employee_salary
where Salary>=50000;
Select * 
from employee_salary
where salary>=10000;

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	Select *
	from employee_salary
	where salary >= 50000;
	Select *
	from employee_salary
	where employee_salary>=10000;
END $$
DELIMITER ;

CALL large_salaries3();

DELIMITER $$
CREATE PROCEDURE large_salaries4(EmployeeID_param int)
BEGIN
	Select salary
	from employee_salary
	where EmployeeID = EmployeeID_param;
END $$
DELIMITER ;

CALL large_salaries4(1003);




