/*8. Create View Employees Hired After 2000 Year

Create a SQL query that creates view "V_EmployeesHiredAfter2000" with the first and the last name 
for all employees, hired after the year 2000.*/

CREATE VIEW V_EmployeesHiredAfter2000
AS
SELECT 
FirstName,
LastName
FROM Employees
WHERE YEAR(HireDate) >2000

SELECT *FROM V_EmployeesHiredAfter2000

/*9. Length of Last Name

Create a SQL query that finds all employees,
whose last name is exactly 5 characters long*/

SELECT 
FirstName,
LastName
FROM Employees 
WHERE LEN(LastName)=5


/*10. Rank Employees by Salary

Write a query that ranks all employees
using DENSE_RANK. In the DENSE_RANK function, 
employees need to be partitioned by Salary and
ordered by EmployeeID. You need to find only the
employees, whose Salary is between 10000 and 50000
and order them by Salary in descending order*/

SELECT 
EmployeeID,
FirstName,
LastName,
Salary,
 DENSE_RANK ()OVER(PARTITION BY SALARY  
 ORDER BY EmployeeID) AS Rank
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY SALARY DESC

/*11. Find All Employees with Rank 2


Upgrade the query from the previous problem, 
so that it finds only the employees with a Rank 2. 
Order the result by Salary (descending).*/
SELECT*FROM(
SELECT 
EmployeeID,
FirstName,
LastName,
Salary,
 DENSE_RANK ()OVER(PARTITION BY SALARY  
 ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000

) AS t
WHERE [Rank]=2
ORDER BY SALARY DESC




/*Part II – Queries for Geography Database

12. Countries Holding 'A' 3 or More Times

Find all countries which hold the letter 'A' at 
least 3 times in their name (case-insensitively).
Sort the result by ISO code and display the "Country
Name" and "ISO Code".*/
USE Geography
GO
SELECT 
CountryName,
IsoCode
FROM Countries 
WHERE LEN(CountryName)-LEN(REPLACE(LOWER(CountryName), 'a',''))>=3
ORDER BY IsoCode

/*13. Mix of Peak and River Names
Combine all peak names with all river names, so that the last letter 
of each peak name is the same as the first letter of its corresponding river name.
Display the peak names, river names and the obtained mix (mix should be in lowercase). 
Sort the results by the obtained mix.*/

--multiple selection

SELECT
p.PeakName,
r.RiverName,
LOWER(CONCAT(SUBSTRING(p.PeakName, 1, LEN(p.PeakName)-1), r.RiverName)) AS Mix
FROM 
Peaks AS p,
Rivers AS r
WHERE LOWER(RIGHT(PeakName,1))=LOWER(LEFT(RiverName, 1))
ORDER BY Mix

/*Part III – Queries for Diablo Database
14. Games from 2011 and 2012 Year

Find and display the top 50 games which 
start date is from 2011 and 2012 year.
Order them by start date, then by name of the game. 
The start date 
should be in the following format: "yyyy-MM-dd".*/

USE Diablo
GO
SELECT TOP 50
[Name],
CONVERT (VARCHAR(10),[Start], 23) AS [Start]
FROM Games
WHERE Year([Start])  BETWEEN 2011 AND 2012
ORDER BY [Start]
/*15. User Email Providers

Find all users with information about their
email providers. Display the username and email 
provider. Sort the results by email provider 
alphabetically, then by username.*/
SELECT 
Username,
SUBSTRING(Email,CHARINDEX('@', Email)+1, LEN(Email)-CHARINDEX('@', Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username

--16. Get Users with IP Address Like Pattern
/*Find all users with their IP addresses, 
sorted by username alphabetically. Display 
only the rows which IP address matches the 
pattern: "***.1^.^.***".
*/

SELECT
Username,
IpAddress AS [IP Address]
FROM Users
WHERE IpAddress LIKE ('___.1%.%.___')
ORDER BY Username

/*17. Show All Games with Duration and Part of the Day
Find all games with part of the day and duration.
Sort them by game name alphabetically, then by 
duration (alphabetically, not by the timespan) 
and part of the day (all ascending). 
Part of the Day should be Morning 
(time is >= 0 and < 12), Afternoon
(time is >= 12 and < 18), Evening 
(time is >= 18 and < 24). Duration
should be Extra Short (smaller or equal to 3),
Short (between 4 and 6 including),
Long (greater than 6) and Extra 
Long (without duration).
*/
SELECT 
[Name] AS Game,
CASE 
    WHEN DATEPART(HOUR, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
    WHEN DATEPART(HOUR,[Start])BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE  'Evening'
    END AS [Part of the Day],
             CASE
             WHEN Duration <=3 THEN 'Extra Short'
             WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
             WHEN Duration>6 THEN 'Long'
             ELSE 'Extra Long'
             END AS Duration
             
FROM Games
ORDER BY Game, Duration, [Part of the Day]

/*18. Orders Table
ou are given a table 
Orders(Id, ProductName, OrderDate) filled with data.
Consider that the payment for that order must be 
accomplished within 3 days after the order date. 
Also the delivery date is up to 1 month. 
Write a query to show each product's name,
order date, pay and deliver due dates.*/

USE Orders
GO

SELECT
ProductName,
OrderDate,
DATEADD(DAY, 3, OrderDate) AS [Pay Due],
DATEADD(MONTH, 1, OrderDate) AS [Pay Due]
FROM Orders