
Create Table Employee_Demographics 
(EmployeeID int not null, 
First_Name varchar(50), 
Last_Name varchar(50), 
Age int, 
Gender varchar(50),
birth_date date,
primary key(EmployeeID)
);


Create Table Employee_Salary 
(EmployeeID int not null, 
First_Name varchar(50), 
Last_Name varchar(50), 
occupation varchar(50), 
Salary int,
dept_id int
);



Insert into Employee_Demographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male','1979-09-25'),
(1002, 'Pam', 'Beasley', 30, 'Female','1987-03-04'),
(1003, 'Dwight', 'Schrute', 29, 'Male','1994-03-27'),
(1004, 'Angela', 'Martin', 31, 'Female','1962-05-23'),
(1005, 'Toby', 'Flenderson', 32, 'Male','1988-12-01'),
(1006, 'Michael', 'Scott', 35, 'Male','1980-11-11'),
(1007, 'Meredith', 'Palmer', 32, 'Female','1985-07-26'),
(1008, 'Stanley', 'Hudson', 38, 'Male','1962-06-14'),
(1009, 'Kevin', 'Malone', 31, 'Male','1986-07-27');

Insert Into Employee_Salary VALUES
(1001, 'Jim', 'Halpert','Deputy Director of parks and recreation', 45000,1),
(1002, 'Pam', 'Beasley','Deputy Director of parks and recreation', 36000,1),
(1003, 'Dwight', 'Schrute','Entrepreneur', 63000,1),
(1004, 'Angela', 'Martin','Assistant to the parks and recreation', 47000,1),
(1005, 'Toby', 'Flenderson', 'Office manager',50000,1),
(1006, 'Michael', 'Scott','Office manager', 65000,1),
(1007, 'Meredith', 'Palmer','Nurse', 41000,4),
(1008, 'Salesman','Stanley','City Manager', 48000,3),
(1009, 'Kevin', 'Malone','State Auditor', 42000,6);

CREATE TABLE departments(
	department_id int not null auto_increment,
    dept_name varchar(50) not null,
    Primary key(department_id)
);

insert into departments(dept_name)
values
('Parks and Recreation'),
('Animal Control'),
('Public works'),
('Healthcare'),
('Libraray'),
('Finance');

