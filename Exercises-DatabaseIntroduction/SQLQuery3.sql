--ex8

CREATE TABLE Users(
Id BIGINT PRIMARY KEY IDENTITY(1, 1),
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(MAX) NULL
CONSTRAINT _picturesize CHECK (ProfilePicture IS NULL OR DATALENGTH(ProfilePicture)<=900*1024),
LastLoginTime DATETIME,
IsDeleted NVARCHAR(5),
CONSTRAINT _isDELETESTEXT CHECK (IsDeleted IN('true', 'false'))
)
INSERT INTO Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
      ('user', '12333', NULL, '2025-09-19 15:30:00', 'true'),
       ('user', '12333', NULL, '2025-09-19 15:30:00', 'true'),
        ('user', '12333', NULL, '2025-09-19 15:30:00', 'true'),
         ('user', '12333', NULL, '2025-09-19 15:30:00', 'true'),
          ('user', '12333', NULL, '2025-09-19 15:30:00', 'true');

SELECT*FROM Users;





