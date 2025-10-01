--1. One-To-One Relationship

CREATE DATABASE TableRelations

GO

USE TableRelations
CREATE TABLE Passports(
PassportID INT PRIMARY KEY IDENTITY (101, 1),
PassportNumber CHAR(8) NOT NULL
)
CREATE TABLE Persons(
PersonID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
Salary DECIMAL(10, 2) NOT NULL,
PassportID INT 
FOREIGN KEY REFERENCES Passports(PassportID) UNIQUE
)
INSERT INTO Passports(PassportNumber)
VALUES
      ('N34FG21B'),
	  ('K65LO4R7'),
	  ('ZE657QP2');

INSERT INTO Persons(FirstName, Salary, PassportID)
VALUES
      ('Roberto',43300.00, 102 ),
	  ('Tom', 56100.00, 103),
	  ('Yana', 60200.00, 101)

--2. One-To-Many Relationship

CREATE TABLE Manufacturers(
ManufacturerID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(20) NOT NULL,
EstablishedOn DATETIME NOT NULL
)
CREATE TABLE Models(
ModelID INT PRIMARY KEY IDENTITY(101, 1),
[Name] VARCHAR(30) NOT NULL,
ManufacturerID INT 
FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)
INSERT INTO Manufacturers([Name], EstablishedOn)
VALUES
       ('BMW', '1916-07-03'),
	   ('Tesla', '2003-01-01'),
	   ('Lada', '1966-01-05')
;
INSERT INTO Models([Name],ManufacturerID)
VALUES ('X1', 1),
       ('i6', 1),
	   ('Model S', 2),
	   ('Model X', 2),
	   ('Model 3', 2),
	   ('Nova', 3)



	   --3. Many-To-Many Relationship


USE Geography
GO
--EX 9
SELECT
m.MountainRange,
p.PeakName,
p.Elevation
FROM Mountains AS m JOIN Peaks AS p
ON m.Id=P.MountainId
	WHERE m.MountainRange='Rila'
	ORDER BY
	p.Elevation DESC 


