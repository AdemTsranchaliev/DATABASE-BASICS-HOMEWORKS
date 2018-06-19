CREATE DATABASE ReportService

USE ReportService
GO


CREATE TABLE Users
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 Username NVARCHAR(30) NOT NULL UNIQUE,
 Password NVARCHAR(50) NOT NULL,
 Name NVARCHAR(50),
 Gender CHAR(1)  CHECK(Gender IN ('M','F')),
 BirthDate DATETIME,
 Age INT,
 Email NVARCHAR(50) NOT NULL,
)

CREATE TABLE Departments
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 Name NVARCHAR(50) NOT NULL,
)

CREATE TABLE Employees
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 FirstName NVARCHAR(25) NOT NULL,
 LastName NVARCHAR(25) ,
 Gender CHAR(1) CHECK(Gender IN ('M','F')),
 BirthDate DATETIME,
 Age INT,
 DepartmentId INT NOT NULL,
 FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)

CREATE TABLE Categories
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 Name NVARCHAR(50) NOT NULL,
 DepartmentId INT ,
 FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)

CREATE TABLE Status
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 Label NVARCHAR(30) NOT NULL
)

CREATE TABLE Reports
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 CategoryId INT NOT NULL,
 FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
 StatusId INT NOT NULL,
 FOREIGN KEY (StatusId) REFERENCES Status(Id),
 OpenDate DATETIME NOT NULL,
 CloseDate DATETIME,
 Description NVARCHAR(200),
 UserId INT NOT NULL,
 FOREIGN KEY (UserId) REFERENCES Users(Id),
 EmployeeId INT ,
 FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
)