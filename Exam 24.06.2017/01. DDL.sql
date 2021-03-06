CREATE TABLE Cities
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 [Name] NVARCHAR(20) NOT NULL,
 CountryCode CHAR(2) NOT NULL
)

CREATE TABLE Hotels
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 [Name] NVARCHAR(30) NOT NULL,
 CityId INT NOT NULL,
 FOREIGN KEY (CityId) REFERENCES Cities(Id),
 EmployeeCount INT NOT NULL,
 BaseRate DECIMAL(16,4) CHECK(BaseRate >= 0)
)

CREATE TABLE Rooms
(
 Id INT PRIMARY KEY IDENTITY NOT NULL,
 Price DECIMAL(16,4) NOT NULL CHECK(Price >=0),
 [Type] NVARCHAR(20) NOT NULL,
 Beds INT NOT NULL,
 HotelId INT NOT NULL,
 FOREIGN KEY (HotelId) REFERENCES Hotels(Id)
)

CREATE TABLE Trips
(
 Id INT NOT NULL PRIMARY KEY IDENTITY,
 RoomId INT NOT NULL,
 FOREIGN KEY (RoomId) REFERENCES Rooms(Id),
 BookDate DATE NOT NULL ,
 ArrivalDate DATE NOT NULL ,
 ReturnDate DATE NOT NULL,
 CancelDate DATE,
 
)

CREATE TABLE Accounts
(
 Id INT PRIMARY KEY NOT NULL IDENTITY,
 FirstName NVARCHAR(50) NOT NULL,
 MiddleName NVARCHAR(20),
 LastName NVARCHAR(50) NOT NULL,
 CityId INT NOT NULL,
 FOREIGN KEY (CityId) REFERENCES Cities(Id),
 BirthDate DATE NOT NULL,
 Email NVARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE AccountsTrips
(
 AccountId INT NOT NULL REFERENCES Accounts(Id),
 TripId INT NOT NULL REFERENCES Trips(Id),
 Luggage INT NOT NULL CHECK (Luggage>=0),
 CONSTRAINT PK_AccountsTrips
 PRIMARY KEY(AccountId,TripId)
)



SELECT * FROM AccountsTrips