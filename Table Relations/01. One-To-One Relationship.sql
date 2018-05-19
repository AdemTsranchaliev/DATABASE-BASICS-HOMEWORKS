

CREATE TABLE Passports
(
  PassportID int PRIMARY KEY,
  PassportNumber varchar(255) NOT NULL
)

CREATE TABLE Persons
(
  PersonalID int PRIMARY KEY IDENTITY,
  FirstName varchar(50) NOT NULL,
  Salary money,
  PassportID int REFERENCES Passports(PassportId) UNIQUE

)


INSERT INTO Passports(PassportID,PassportNumber)
VALUES (101,'N34FG21B'),(102,'K65LO4R7'),(103,'ZE657QP2')

INSERT INTO Persons(FirstName,Salary,PassportID)
VALUES ('Roberto',43300.00,102),('Tom',56100.00,103),('Yana',60200.00,101)


SELECT * FROM Passports

SELECT * FROM Persons

