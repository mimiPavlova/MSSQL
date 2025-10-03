--1. Find Names of All Employees by First Name
--Create a SQL query that finds all employees whose first name starts with "Sa". As a result, display "FirstName" and "LastName".
SELECT 
FirstName,
LastName
FROM Employees
WHERE FirstName LIKE 'Sa%'


--2. Find Names of All Employees by Last Name
--Create a SQL query that finds all employees whose last name contains "ei". As a result, display "FirstName" and "LastName".

SELECT
FirstName,
LastName
FROM Employees
WHERE LastName Like '%ei%'

--3. Find First Names of All Employees

/*Create a SQL query that finds the first names of all employees whose department ID is 3 or 10,
and the hire year is between 1995 and 2005 inclusive*/

SELECT FirstName 
FROM Employees
WHERE DepartmentID=3 OR DepartmentID=10  

/*4. Find All Employees Except Engineers

Create a SQL query that finds the first and last names of every employee, 
whose job title does not contain "engineer".*/

SELECT 
FirstName,
LastName
FROM Employees
WHERE CHARINDEX('engineer', JobTitle)<=0
/*3. Find First Names of All Employees

Create a SQL query that finds the first
names of all employees whose department 
ID is 3 or 10, and the 
hire year is between 1995 and 2005 inclusive.*/

SELECT 
FirstName
FROM Employees
WHERE DepartmentID IN (3, 10)
AND YEAR(HireDate) BETWEEN 1995 AND 2005

/*5. Find Towns with Name Length
Create a SQL query that finds all town names, which are 5 or 6 symbols long. 
Order the result alphabetically by town name.*/

SELECT
[Name]
FROM Towns
WHERE LEN([Name])  IN( 5, 6)
ORDER BY [Name]

/*6. Find Towns Starting With

Create a SQL query that finds all towns with names starting with 'M', 'K', 'B' or 'E'. 
Order the result alphabetically by town name.
*/

SELECT
TownID,
[Name]
FROM Towns
WHERE [Name] LIKE ('[MKBE]%')
ORDER BY [Name]

--second way

SELECT 
TownID,
[Name]
FROM Towns
WHERE LEFT([NAME], 1) IN ('M', 'K', 'B', 'E')
ORDER BY [Name]

/*7. Find Towns Not Starting With

Create a SQL query that finds all towns, 
which do not start with 'R', 'B' or 'D'. 
Order the result alphabetically by name.*/

SELECT 
TownID,
[Name]
FROM Towns
WHERE [Name] NOT LIKE ('[RBD]%')
ORDER BY [NAME]

/*8. Create View Employees Hired After 2000 Year

Create a SQL query that creates view "V_EmployeesHiredAfter2000" with the first and the last name for all 
employees, hired after 
the year 2000.
*/

SELECT 
FirstName,
LastName
FROM Employees
WHERE DATEPART(YEAR, HireDate) >=2000