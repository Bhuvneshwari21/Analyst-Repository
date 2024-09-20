-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
( first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

Select *
from temp_table;

insert into temp_table
values
('Alex','Frebrg','Lords of the rings');

Select *
from temp_table;


CREATE TEMPORARY TABLE salary_over_30k
Select *
from employee_salary
where Salary>=30000;

Select *
from salary_over_30k;



