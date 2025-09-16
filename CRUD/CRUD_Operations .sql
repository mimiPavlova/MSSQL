SELECT 
TOP 5

FirstName, 
LastName, 
JobTitle
 FROM Employees;

 SELECT 
 [Name],
 StartDate
 FROM Projects
WHERE EndDate IS NULL;

SELECT
FirstName, 
LastName,
JobTitle
FROM Employees
WHERE DepartmentID=3;


SELECT
[Name]
FROM Departments;

SELECT
FirstName,
LastName,
Salary
FROM Employees;

SELECT 
FirstName,
MiddleName,
LastName
FROM Employees;

--JOIN 
SELECT
  FirstName AS 'Първо име', 
  LastName,
  JobTitle,
  d.[Name] AS DepartmantName
FROM Employees AS e JOIN Departments as d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID=3;

--ПРОЕКЦИЯ, СЕЛЕКЦИЯ, JOIN


--Конкатенация на данни+ извличането им в нова колона

SELECT 

(FirstName+'.'+LastName+'@softuni.bg') AS [Full Email Address]
FROM Employees

