-- Unions - used to combine two select statement
-- we should use same number of col in both statement
-- union all give all values while union distinct give unique values

SELECT FirstName, LastName
FROM employeedemographics
UNION distinct
SELECT FirstName, LastName
FROM employeedemographics
;

SELECT FirstName, LastName, 'Old' AS Label
From employeedemographics
WHERE age>30 AND gender = 'Female'
UNION
SELECT FirstName, LastName, 'Old' AS Label
FROM employeedemographics
WHERE FirstName LIKE 'a%';