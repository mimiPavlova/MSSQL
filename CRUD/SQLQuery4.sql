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
  FirstName AS 'œ˙‚Ó ËÏÂ', 
  LastName,
  JobTitle,
  d.[Name] AS DepartmantName
FROM Employees AS e JOIN Departments as d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID=3;

--œ–Œ≈ ÷»ﬂ, —≈À≈ ÷»ﬂ, JOIN


--concatianation+ selecting on new row with different name

SELECT 

(FirstName+'.'+LastName+'@softuni.bg') AS [Full Email Address]
FROM Employees


SELECT
EmployeeID AS 'ID',
FirstName AS 'First Name',
LastName AS 'Last Name',
MiddleName AS 'Middle Name',
JobTitle AS 'Job Title',
DepartmentID AS 'DeptID',
ManagerID AS 'MngrID',
HireDate AS 'Hire Date',
Salary AS 'Salary',
AddressID   AS 'AddressID'
FROM Employees
WHERE JobTitle='Sales Representative'

--DISTINCT--select the different values 

SELECT DISTINCT 
Salary AS 'Salary'
FROM Employees