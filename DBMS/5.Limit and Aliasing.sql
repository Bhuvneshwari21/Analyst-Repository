-- Limit & Aliasing 

SELECT * 
FROM employeedemographics
order by age DESC
LIMIT 3;

SELECT * 
FROM employeedemographics
order by age DESC
LIMIT 2, 1;

-- Aliasing

SELECT Gender, avg(Age) AS avg_age
FROM employeedemographics
group by Gender
Having avg(Age)>31;