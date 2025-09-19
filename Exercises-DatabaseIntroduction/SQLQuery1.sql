--EX 1
CREATE DATABASE Minions
GO
--EX2
USE Minions
GO

CREATE TABLE Minions
(
Id INT PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL,
Age INT  NULL
)

CREATE TABLE Towns(
Id INT PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL
)
GO
--EX 3
--adding id column in Minions


ALTER TABLE Minions
ADD TownId INT NULL
GO

--adding foreign key/ relation
ALTER TABLE MINIONS
ADD CONSTRAINT FK_Minions_Towns
FOREIGN KEY(TownId) REFERENCES Towns(Id)


GO
--EX 4: INSERT RECORDS IN BOTH TABLES

   --we have to insert in towns first

   INSERT INTO Towns(Id, [Name])
   VALUES
         (1, 'Sofia'),
         (2, 'Plovdiv'),
         (3, 'Varna');


INSERT INTO Minions(Id, [Name],Age, TownId)
VALUES
      (1, 'Kevin', 22, 1),
      (2, 'Bob', 15, 3),
      (3, 'Steward', NULL, 2);

      SELECT*FROM Minions;


      SELECT *FROM Towns

      --EX 5-delete all records from minions
      TRUNCATE TABLE Minions;

      --EX6-delete tables

      DROP TABLE Minions;
      DROP TABLE Towns;