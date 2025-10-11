/*1. Employees with Salary Above 35000

Create stored procedure 
usp_GetEmployeesSalaryAbove35000 that
returns all employees' 
first and last names, whose salary above 35000.*/

CREATE OR ALTER PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
SELECT
FirstName,
LastName
FROM Employees
WHERE Salary>35000


/*2. Employees with Salary Above Number

Create a stored procedure usp_GetEmployeesSalaryAboveNumber 
that accepts a number (of type DECIMAL(18,4)) 
as parameter and returns all employees' first and 
last names, whose salary is above or equal to the given number.*/

CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(
@Num DECIMAL(18,4)
)
AS
BEGIN
SELECT 
FirstName, LastName
FROM Employees
WHERE SALARY>=@Num
END;

/*3. Town Names Starting With

Create a stored procedure usp_GetTownsStartingWith that accepts
a string as parameter and returns all town names 
starting with that string.*/

CREATE OR ALTER PROCEDURE usp_GetTownsStartingWith(@Simbol VARCHAR(50))
AS
BEGIN
SELECT
[Name] as Town
FROM Towns
WHERE LEFT([Name], LEN(@Simbol))=@Simbol
END


/*4. Employees from Town

Create a stored procedure usp_GetEmployeesFromTown
that accepts town name as parameter and returns the 
first and last name of those employees, who live in 
the given town.*/

CREATE OR ALTER PROCEDURE usp_GetEmployeesFromTown(@TownName VARCHAR(50))
AS BEGIN
SELECT
e.FirstName,
e.LastName
FROM  Employees AS e
 JOIN
Addresses AS a
ON e.AddressID=a.AddressID
JOIN Towns  AS t
ON t.TownID=a.TownID
WHERE t.Name=@TownName
END
EXEC usp_GetEmployeesFromTown sofia

--ex 5
CREATE FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18,4))
	RETURNS VARCHAR(10)
	BEGIN
	DECLARE @level VARCHAR(10)
	IF (@Salary<30000)
	BEGIN
	SET @level='Low'
	 END
	 ELSE IF (@Salary<=50000)
	 BEGIN
	  SET @level='Average'
	 END
	 else
	 BEGIN
	 SET @level='High'
	 END
	 RETURN @level
	END

	/*6. Employees by Salary Level

Create a stored procedure usp_EmployeesBySalaryLevel
that receives as parameter level of salary 
(low, average, or high) and print the names of all 
employees, who have the given level of salary. 
You should use the function 
- "dbo.ufn_GetSalaryLevel(@Salary)", which was 
part of the previous task, inside your 
"CREATE PROCEDURE …" query.*/


CREATE OR ALTER PROCEDURE usp_EmployeesBySalaryLevel(@salaryLevel VARCHAR(10))
AS 
BEGIN
SELECT
FirstName AS [First Name],
LastName AS [Last Name]
FROM Employees
WHERE dbo.ufn_GetSalaryLevel (Salary) = @salaryLevel
END
GO

/*7. Define Function

Define a function 
ufn_IsWordComprised(@setOfLetters, @word) 
that returns true or false,
depending on that if the word is comprised 
of the given set of letters.*/
CREATE FUNCTION ufn_IsWordComprised(
@SetOfLetters VARCHAR(50), @Word VARCHAR(50)
)
RETURNS BIT
AS
BEGIN
DECLARE @wordIndex TINYINT
DECLARE @currentCharacter CHAR(1)


		SET @wordIndex=1;
		WHILE @wordIndex<=LEN(@Word)
		BEGIN
		SET @currentCharacter=SUBSTRING(@Word, @wordIndex, 1)
					BEGIN
					IF CHARINDEX(@currentCharacter, @setOfLetters)<=0
					--not found
					RETURN 0
					END
		SET @wordIndex+=1
		
        END
		RETURN 1
        
END


/*9. Find Full Name

You are given a database schema with tables
AccountHolders(Id (PK), FirstName, LastName, SSN) 
and Accounts(Id (PK), AccountHolderId (FK), Balance).
Write a stored procedure usp_GetHoldersFullName that 
selects the full name of all people.*/

USE Bank
GO
CREATE PROCEDURE usp_GetHoldersFullName
AS 
SELECT
CONCAT_WS(' ',FirstName,LastName ) AS [Full Name]
FROM AccountHolders

/*
10. People with Balance Higher Than

Your task is to create a stored procedure 
usp_GetHoldersWithBalanceHigherThan that accepts
a number as a parameter and returns all the people,
who have more money in total in all their accounts 
than the supplied number. 
Order them by their first name,
then by their last name.*/
CREATE  OR ALTER PROCEDURE usp_GetHoldersWithBalanceHigherThan(@Money DECIMAL(10, 2))
AS
BEGIN
SELECT
u.FirstName AS [First Name],
u.LastName AS [Last Name]
FROM 
AccountHolders as u
JOIN Accounts AS a
ON u.Id=a.AccountHolderId
GROUP BY a.AccountHolderId, u.FirstName, u.LastName
HAVING  SUM(a.Balance)>@Money
ORDER BY u.FirstName, u.LastName
END

EXEC usp_GetHoldersWithBalanceHigherThan 30000.00


/*11. Future Value Function

Your task is to create a function ufn_CalculateFutureValue that accepts as parameters – sum (decimal), yearly interest rate (float), and the number of years (int). It should calculate and return the future value of the initial sum rounded up to the fourth digit after the decimal delimiter. Use the following formula:

· I – Initial sum

· R – Yearly interest rate

· T – Number of years*/

CREATE OR ALTER FUNCTION ufn_CalculateFutureValue(
@Sum DECIMAL(10,2), @InterestRate FLOAT,
@years TINYINT
)
RETURNS DECIMAL(16,4)
AS
BEGIN
DECLARE @result DECIMAL(16,4);
SET @result=@Sum*POWER(1+ @InterestRate, @years);
 RETURN CEILING(@Result * 10000) / 10000;
END
SELECT dbo.ufn_CalculateFutureValue(1000, 0.10, 5)

/*12. Calculating Interest

Your task is to create a stored procedure 
usp_CalculateFutureValueForAccount that uses
the function from the previous problem to give 
an interest to a person's account for 5 years, 
along with information about their account id, 
first name, last name and current balance as it
is shown in the example below. It should take 

the AccountId and the interest rate as parameters. 
Again, you are provided with the 


dbo.ufn_CalculateFutureValue function,
which was part of the previous task.*/



CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount(@AccountId INT,@InterestRate FLOAT=0.5)
AS
	BEGIN 
	
	SELECT 
	a.Id AS [Account Id],
	ah.FirstName AS [First Name],
	ah.LastName AS [Last Name],
	SUM(a.Balance) AS [Current Balance],
	dbo.ufn_CalculateFutureValue(SUM(a.Balance), @InterestRate, 5 )  AS [Balance in 5 years]
	FROM AccountHolders AS ah
	JOIN Accounts AS a
	ON ah.Id=a.AccountHolderId
	WHERE a.Id = @AccountId;
	END


	CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount
    @AccountId INT,
    @InterestRate FLOAT
AS
BEGIN
    SELECT 
        a.Id AS [Account Id],
        ah.FirstName AS [First Name],
        ah.LastName AS [Last Name],
        a.Balance AS [Current Balance],
        dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5) AS [Balance in 5 years]
    FROM Accounts AS a
    JOIN AccountHolders AS ah
        ON a.AccountHolderId = ah.Id
    WHERE a.Id = @AccountId;
END
