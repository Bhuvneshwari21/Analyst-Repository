-- String functions

-- ORDER BY 1 means we are instructing the db to sort the results based on the first column in the SELECT LIST
SELECT FirstName, length(FirstName)
From employeedemographics
ORDER BY 2;

SELECT UPPER('skuy');
SELECT LOWER('SKY');

SELECT FirstName, upper(FirstName)
FROM employeedemographics;

SELECT RTRIM('     SKY          ');

-- how many char we want to select from left and right side
-- substring(col_name, start position, how many char we want)
SELECT FirstName, 
LEFT(FirstName,4),
RIGHT(FirstName,4),
substring(FirstName,3,2)
FROM employeedemographics;

-- replace
SELECT FirstName, replace(FirstName, 'a','z')
FROM employeedemographics;

SELECT FirstName, replace(FirstName, 'a','z')
FROM employeedemographics;

-- locate()
SELECT FirstName, locate('a',FirstName)
FROM employeedemographics;

-- concat
SELECT FirstName, LastName,
concat(FirstName,' ',LastName)
FROM employeedemographics;
