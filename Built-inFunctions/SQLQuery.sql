


SELECT
A,
H,
(A*H)/2 AS Area FROM Triangles2

SELECT PI()


--Examle: Find the length of a line by given coordinates of the end points

SELECT
Id,
SQRT(SQUARE(X1-X2)+SQUARE(Y1-Y2)) AS Lenght
FROM Lines

-- Calculate the required number of pallets to ship each item
-- BoxCapacity specifies how many items can fit in one box
-- PalletCapacity specifies how many boxes can fit in a pallet

SELECT
Id,
CEILING(
CEILING(
CAST(Quantity AS FLOAT)/
BoxCapacity
)/
PalletCapacity
)
AS [Number of pallets] 
FROM Products



--Problem: Quarterly Report

--Prepare sales data for aggregation by displaying yearly quarter,
--month, year and day of sale
SELECT 
InvoiceId,
Total,
DATEPART(QUARTER, InvoiceDate) AS Quarter,
DATEPART(MONTH, InvoiceDate) AS Month,
DATEPART(YEAR, InvoiceDate) AS Year,
DATEPART(DAY, InvoiceDate) AS DAY
FROM Invoices;

--DATEDIFF
--Example: Show employee experience
USE SoftUni
GO
SELECT
EmployeeID,FirstName, LastName, 
DATEDIFF(YEAR, HireDate, '2025/10/02') AS [Years in service]
FROM Employees

--DATENAME--gets a sring representtion of a date's part
SELECT DATENAME(WEEKDAY, '2005/08/26') AS WeekDay


--converting data types
SELECT CAST('32' AS INT)+2

--offset and fetch

 --**order by something and get next n columns

SELECT 
*
FROM Employees
ORDER BY EmployeeID
OFFSET 1 * 10 - 10 ROWS
FETCH NEXT 10 ROWS ONLY