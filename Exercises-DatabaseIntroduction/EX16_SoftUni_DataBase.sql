CREATE DATABASE SoftUni;
GO
USE SoftUni

CREATE TABLE Towns(
Id INT PRIMARY KEY IDENTITY(1, 1),
[Name] NVARCHAR(50) NOT NULL
)
 
 CREATE TABLE Addresses(
 Id INT PRIMARY KEY IDENTITY(1,1),
 AddressText NVARCHAR(200) NOT NULL,
 TownId INT FOREIGN KEY REFERENCES Towns (Id)  Not null
 ) 
 CREATE TABLE Departments(
 Id INT PRIMARY KEY IDENTITY(1,1),
 [Name] VARCHAR(50) UNIQUE NOT NULL
 )

 CREATE TABLE Employees(
 Id Int PRIMARY KEY IDENTITY(1,1),
 FirstName VARCHAR(50) NOT NULL,
 MiddleName VARCHAR(50) NULL,
 LastName VARCHAR(80) NULL,
 JobTitle VARCHAR(100) NOT NULL,
 DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
 HireDate DATE DEFAULT(GETDATE())NOT NULL,
 Salary DECIMAL (16,4) NOT NULL,
 AddressId INT FOREIGN KEY REFERENCES Addresses(Id) NOT NULL,

 )
INSERT INTO Towns ([Name]) VALUES
(N'София'),
(N'Пловдив'),
(N'Варна'),
(N'Бургас');

INSERT INTO Addresses (AddressText, TownId) VALUES
(N'ул. Иван Вазов 15', 1),
(N'бул. Цариградско шосе 100', 1),
(N'ул. Капитан Райчо 22', 2),
(N'ул. Христо Ботев 7', 3),
(N'ул. Александровска 50', 4);

INSERT INTO Departments ([Name]) VALUES
(N'HR'),
(N'Finance'),
(N'IT'),
(N'Sales'),
(N'Marketing');

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES
(N'Иван', N'Георгиев', N'Петров', N'HR Specialist', 1, '2020-05-10', 2500.00, 1),
(N'Мария', NULL, N'Иванова', N'Accountant', 2, '2021-01-15', 3200.50, 2),
(N'Георги', N'Иванов', N'Стоянов', N'Software Developer', 3, '2019-11-01', 4500.75, 3),
(N'Анна', NULL, N'Николова', N'Sales Manager', 4, '2022-03-20', 3700.00, 4),
(N'Петър', N'Димитров', N'Колев', N'Marketing Specialist', 5, '2023-07-05', 2800.00, 5);
