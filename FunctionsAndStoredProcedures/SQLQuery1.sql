--CREATE SCALAR FUNCTION
	CREATE FUNCTION udf_ProjectDuration(@StartDate DATETIME, @EndDate DATETIME)
	RETURNS INT 
	AS
	BEGIN
	

	    DECLARE @projectDuration INT
		IF (@EndDate IS NULL)
		BEGIN
		SET @EndDate=GETDATE()
		END


		SET @projectDuration=DATEDIFF(WEEK, @StartDate, @EndDate)
		RETURN @projectDuration
	END;

	--USING

	SELECT
	Name,
	dbo.udf_ProjectDuration(StartDate, EndDate) AS [PROJECT Duration]
	FROM Projects


	CREATE FUNCTION udf_AverageSalary(@DepartmentName VARCHAR(50))
	RETURNS TABLE AS
	RETURN
	(
	SELECT 
	d.Name AS DepartmentName,
	AVG(e.Salary) AS AverageSalary
	FROM 
	Departments AS d
	JOIN Employees AS e
	ON d.DepartmentID=e.DepartmentID
	WHERE d.Name=@DepartmentName
	GROUP BY d.Name)
	


	
	SELECT* FROM udf_AverageSalary('Sales')

	--ex
	CREATE FUNCTION udf_SalaryLevel(@Salary MONEY)
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

	SELECT
	FirstName,
	LastName,
	Salary,
	dbo.udf_SalaryLevel(Salary)
	FROM Employees




	CREATE OR ALTER PROCEDURE usp_SelectEmployeesBySeniority
	(@MinYears INT=5)
	AS
	SELECT
	FirstName,
	LastName,
	HireDate,
	DATEDIFF(YEAR, HireDate, GETDATE()) AS YEARSOFDUty
	FROM Employees
	WHERE DATEDIFF(YEAR, HireDate, GETDATE())>@MInYears
	ORDER BY HireDate
	--check for dependency
	EXEC sp_depends  usp_SelectEmployeesBySeniority
	



	
	CREATE OR ALTER PROCEDURE usp_SelectEmployeesBySeniority
	(@MinYears INT=5)
	AS
	SELECT
	FirstName,
	LastName,
	HireDate,
	DATEDIFF(YEAR, HireDate, GETDATE()) AS YEARSOFDUty
	FROM Employees
	WHERE DATEDIFF(YEAR, HireDate, GETDATE())>@MinYears
	ORDER BY HireDate
	--check for dependency
	EXEC usp_SelectEmployeesBySeniority @MinYears=23



	CREATE OR ALTER PROCEDURE usp_AddNumbers
	(@FirstNumber INT, @SecondNumber INT, @RESULT INT OUTPUT)
	AS
	SET @RESULT=@FirstNumber+@SecondNumber
	END
	GO

	DECLARE @answer INT 
	EXEC usp_AddNumbers 5, 6, @answer OUTPUT

	SELECT CONCAT_WS(' ', 'THE RESULT IS', @answer)

	DECLARE @test INT
	SELECT 1/0
	SET @test=@@ERROR
