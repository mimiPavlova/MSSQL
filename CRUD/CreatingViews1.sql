--Problem 17!!!

CREATE VIEW  [V_EmployeeNameJobTitle]
         AS
   SELECT CONCAT(FirstName, ' ', ISNULL(MiddleName+' ', ' '), LastName)
      AS [Full Name],
JobTitle AS [Job Title]
FROM Employees;

SELECT*FROM [V_EmployeeNameJobTitle]