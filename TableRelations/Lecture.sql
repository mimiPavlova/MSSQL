--1. One-To-One Relationship
USE MASTER 
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

	   CREATE TABLE Students(
	   StudentID INT PRIMARY KEY IDENTITY,
	   [Name] VARCHAR(50) NOT NULL
	   )
	   CREATE TABLE Exams(
	   ExamID INT PRIMARY KEY IDENTITY(101, 1),
	   [Name] VARCHAR(100) NOT NULL
	   )

	   --MAPPING TABLE
	   CREATE TABLE StudentsExams(
	   StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	   ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL,
	    CONSTRAINT PK_Composite_StudentID_ExamID PRIMARY KEY(StudentID, ExamID) 

	   );

INSERT INTO Students([Name])
VALUES('Mila'), ('Toni'), ('Ron');

INSERT INTO Exams([Name])
VALUES ('StudentsExams'), ('Neo4j'), ('Oracle 11g');

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES 
      (1, 101),
	  (1, 102),
	  (2, 101),
	  (3, 103),
	  (2, 102),
	  (2, 103);



	  --4. Self-Referencing

	  CREATE TABLE Teachers(
	  TeacherID INT PRIMARY KEY IDENTITY(101,1),
	  [Name] VARCHAR(60) NOT NULL,
	  ManagerID INT FOREIGN KEY
	  REFERENCES Teachers(TeacherID)
	  )


	   INSERT INTO Teachers ([Name], ManagerID)
	   VALUES
	        ('John', NULL),
			('Maya', 106),
			('Silvia', 106),
			('Ted', 105),
			('Mark', 101),
			('Greata', 101);



	   --5. Online Store Database

	   CREATE TABLE ItemTypes(
	   ItemTypeID INT PRIMARY KEY,
	   [Name] VARCHAR(50) NOT NULL
	   )

	   CREATE TABLE Items(
	   ItemID INT PRIMARY KEY,
	   [Name] VARCHAR (50) NOT NULL,
	   ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
	   )

	    CREATE TABLE Cities(
  CityID INT PRIMARY KEY,
  [Name] VARCHAR(50) NOT NULL
  )
  CREATE TABLE Customers(
  CustomerID INT PRIMARY KEY,
  [Name] VARCHAR(50) NOT NULL,
  Birthday DATE NOT NULL,
  CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID))

CREATE TABLE OrderItems(
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ItemID INT FOREIGN KEY REFERENCES Items(ItemID)
CONSTRAINT FK_OrderItems_Items_Orders
PRIMARY KEY(OrderID, ItemID)
)



--6. University Database

CREATE TABLE Majors(
MajorID INT PRIMARY KEY,
[Name] VARCHAR(50)
)

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
StudentNumber INT NOT NULL,
StudentName VARCHAR(80),
MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)
CREATE TABLE Payments(
PaimentID INT PRIMARY KEY,
PaymentDate DATE NOT NULL,
PaymentAmount DECIMAL(10, 2) NOT NULL,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)
CREATE TABLE Subjects(
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(50) NOT NULL);
CREATE TABLE Agenda (
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
CONSTRAINT FK_Agenda_Students_Subjects PRIMARY KEY(StudentID, SubjectID))

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