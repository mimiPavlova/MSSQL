
--EX 7
CREATE TABLE People(
Id BIGINT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX) NULL,
Height DECIMAL(6, 2)  NULL,
[Weight] DECIMAL(5, 2) NULL,
Gender CHAR(1) 
CONSTRAINT _gender CHECK (Gender in('m', 'f')),
BirthDate DATE NOT NULL,
Biography NVARCHAR(MAX)  NULL
)


INSERT INTO People( [Name], Picture, Height, [Weight], Gender, BirthDate, Biography)
VALUES
      ( 'Person1', NULL, 189.21, 98.22, 'm', '1999-04-11', NULL ),
      ('Person2', NULL, 189.21, 98.22, 'm', '1999-04-11', NULL ),
      ('Person3', NULL, 189.21, 98.22, 'm', '1999-04-11', NULL ),
      ('Person4', NULL, 189.21, 98.22, 'm', '1999-04-11', NULL ),
      ('Person5', NULL, 189.21, 98.22, 'm', '1999-04-11', NULL );

      SELECT *FROM People;