SELECT * 
FROM parks_and_preferences.employeedemographics;



SELECT FirstName, 
LastName,
Age,
(Age + 10)*10 +10
FROM parks_and_preferences.employeedemographics;
# PEMDAS 

SELECT distinct FirstName, Gender
From parks_and_preferences.employeedemographics;