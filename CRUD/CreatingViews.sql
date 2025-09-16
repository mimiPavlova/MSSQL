CREATE VIEW V_EmployeesSalaries AS 
SELECT
CONCAT_WS(' ', FirstName, ISNULL(MiddleName+' ', ' '), LastName) AS 'Full Name',
JobTitle AS 'Job Tittle'
FROM Employees

--USING VIEW 
SELECT*FROM V_EmployeesSalaries