/*Use "SoftUni" database to create a query which prints the
total sum of salaries for each department
▪ Order them by DepartmentID (ascending)
*/

USE SoftUni
GO

SELECT
DepartmentID,
SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID,Salary


/*1. Records' Count

Import the database and send the total count of
records from the one and only table to Mr. Bodrog.
Make sure nothing gets lost.*/
USE Gringotts
GO

SELECT
COUNT(*) AS [Count]
FROM WizzardDeposits 

/*2. Longest Magic Wand

Select the size of the longest magic wand. 
Rename the new column appropriately.*/

SELECT 
Max(w.MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits AS w

/*3. Longest Magic Wand Per Deposit Groups

For wizards in each deposit group show the longest
magic wand. Rename the new column appropriately*/

SELECT 
w.DepositGroup,
MAX(w.MagicWandSize) AS LongestMagicWand
FROM 
WizzardDeposits AS w
GROUP BY w.DepositGroup


/*4. Smallest Deposit Group Per Magic Wand Size

Select the two deposit groups with the lowest average wand size.*/

SELECT TOP 2
w.DepositGroup
FROM  WizzardDeposits AS w
GROUP BY w.DepositGroup
ORDER BY AVG(w.MagicWandSize) 


/*
5. Deposits Sum

Select all deposit groups and their total deposit 
sums.*/

SELECT 
w.DepositGroup,
SUM(w.DepositAmount) AS TotalSum
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

/*6. Deposits Sum for Ollivander Family

Select all deposit groups and their total
deposit sums, but only for the wizards, 
who have their magic wands crafted by the 
Ollivander family.*/

SELECT 
w.DepositGroup,
SUM(w.DepositAmount) AS TotalSum,
w.MagicWandCreator
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator='Ollivander family'
GROUP BY w.DepositGroup,MagicWandCreator




/*7. Deposits Filter

Select all deposit groups and their total deposit 
sums, but only for the wizards, who have their magic 
wands crafted by the Ollivander family. Filter total 
deposit amounts lower than 150000. Order by total
deposit amount in descending order.*/

SELECT 
w.DepositGroup,
SUM(w.DepositAmount) as TotalSum
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator='Ollivander family'
GROUP BY DepositGroup, MagicWandCreator
HAVING SUM(w.DepositAmount) <150000
ORDER BY TotalSum DESC

/*8. Deposit Charge

Create a query that selects:

· Deposit group

· Magic wand creator

· Minimum deposit charge for each group

Select the data in ascending order by
MagicWandCreator and DepositGroup*/

SELECT 
w.DepositGroup,
w.MagicWandCreator,
MIN(w.DepositCharge) AS MinDepositCharge
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup, w.MagicWandCreator
ORDER BY w.MagicWandCreator, DepositGroup

/*9. Age Groups

Write down a query that creates 7 different groups based on their age.

Age groups should be as follows:

· [0-10]

· [11-20]

· [21-30]

· [31-40]

· [41-50]

· [51-60]

· [61+]

The query should return

· Age groups

· Count of wizards in it*/

SELECT 
AgeGroup,
COUNT(*) AS COUNT --does not count null values 
FROM
(
SELECT 
Age,
CASE
WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
WHEN [Age]>=61 THEN '[61+]'
ELSE NULL
END 
AS AgeGroup
FROM WizzardDeposits
) 
		AS AgeGroupingTemp
		GROUP BY AgeGroup




/*10. First Letter

Create a query that returns all the unique 
wizard first letters of their first names only 
if they have deposit of type Troll Chest. Order
them alphabetically. Use GROUP BY for uniqueness.

*/


SELECT 
LEFT(FirstName, 1) AS FirstLetter
FROM WizzardDeposits
GROUP BY DepositGroup,LEFT(FirstName, 1)
HAVING DepositGroup='Troll Chest'


/*
