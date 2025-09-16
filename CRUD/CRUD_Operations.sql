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
  FirstName AS '����� ���', 
  LastName,
  JobTitle,
  d.[Name] AS DepartmantName
FROM Employees AS e JOIN Departments as d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID=3;

--��������, ��������, JOIN


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


SELECT
FirstName,
LastName,
JobTitle
FROM Employees
WHERE Salary  BETWEEN 20000 AND 30000


SELECT
CONCAT_WS(' ',FirstName,MiddleName,LastName) AS ["Full Name]
FROM Employees
WHERE Salary=25000 OR Salary = 14000 OR Salary= 12500 OR Salary= 23600;


SELECT
FirstName,
LastName
FROM Employees
WHERE ManagerID IS NULL

--SORTING
   --USING ORDER BY 

   SELECT
   FirstName,
   LastName,
   Salary
   FROM Employees
   WHERE Salary>50000
   ORDER BY Salary;

   
   SELECT
   FirstName,
   LastName,
   Salary
   FROM Employees
   WHERE Salary>50000
   ORDER BY Salary DESC;

   SELECT TOP 5
   FirstName,
   LastName
   FROM Employees
   WHERE Salary>50500
   ORDER BY Salary DESC

   SELECT
   FirstName,
   LastName
   FROM Employees
   WHERE DepartmentID<>4;

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
ORDER BY Salary DESC,
        FirstName ASC ,
        LastName DESC,
        MiddleName DESC;
        






        


        SELECT DISTINCT
