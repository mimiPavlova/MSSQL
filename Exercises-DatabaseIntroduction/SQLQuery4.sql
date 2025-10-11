CREATE DATABASE Movies

USE Movies
GO


CREATE TABLE Directors
(
Id INT PRIMARY KEY IDENTITY,
DirectorName NVARCHAR(100) NOT NULL,
Notes NVARCHAR(10)
)


CREATE TABLE Genres
(
Id INT PRIMARY KEY IDENTITY,
GenreName NVARCHAR(100) NOT NULL,
Notes NVARCHAR(10)
)


CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(100),
Notes NVARCHAR(10)
)


CREATE TABLE Movies
(
Id INT PRIMARY KEY IDENTITY,
Title NVARCHAR(50), 
DirectorId INT
FOREIGN KEY REFERENCES Directors(Id),
CopyrightYear DATE NOT NULL,
Length DECIMAL(3,2) NOT NULL,
GenreId INT FOREIGN KEY REFERENCES Genres(Id),
CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
Rating INT NOT NULL,
Notes NVARCHAR(100) 
)



INSERT INTO Directors(DirectorName, Notes)
VALUES
     ('Gosho', NULL),
     ('Pesho', 'super'),
     ('Mishi', NULL),
     ('Tosho', NULL)


INSERT INTO GENRES(GenreName, Notes)
VALUES
      ('horor', NULL),
      ('comedy', Null),
      ('exshion', null),
      ('she se grumna', null),
      ('mainata mu', null)

INSERT INTO Categories(CategoryName, Notes)
VALUES
      ('KIDS', NULL),
      ('SOMETHING', NULL),
      ('SOMETHING1', NULL),
      ('SOMETHING2', NULL),
      ('SOMETHING3', NULL)

INSERT INTO Movies(Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
('The Haunted House',      1, '2018-05-20', 1.45, 1, 2, 7,  'Scary but fun'),
('Crazy Vacation',         2, '2020-07-15', 1.30, 2, 1, 8,  'Family comedy'),
('Explosion Zone',         3, '2019-11-02', 2.00, 3, 3, 9,  'Action-packed'),
('She’s Gone Wild',        4, '2021-03-10', 1.55, 4, 4, 6,  'Drama and chaos'),
('The Mother’s Curse',     1, '2017-09-25', 1.40, 5, 5, 5,  'Mystery vibes');
