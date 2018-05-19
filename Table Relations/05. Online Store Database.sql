CREATE TABLE Cities
(
  CityID INT PRIMARY KEY IDENTITY NOT NULL,
  Name VARCHAR(50)
)

CREATE TABLE Customers
(
  CustomerID INT PRIMARY KEY IDENTITY NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Birthday DATE NOT NULL,
  CityID INT REFERENCES Cities(CityID) NOT NULL
)

CREATE TABLE ItemTypes
(
  ItemTypeID INT PRIMARY KEY IDENTITY NOT NULL,
  Name VARCHAR(50)
)

CREATE TABLE Items
(
  ItemID INT PRIMARY KEY IDENTITY NOT NULL,
  Name VARCHAR(50),
  ItemTypeID INT REFERENCES ItemTypes(ItemTypeID) NOT NULL
)

CREATE TABLE Orders
(
  OrderID INT PRIMARY KEY IDENTITY NOT NULL,
  CustomerID INT REFERENCES Customers(CustomerID) NOT NULL
)

CREATE TABLE OrderItems
(
  OrderID INT,
  ItemID INT,

  CONSTRAINT PK_OrderItems
  PRIMARY KEY(OrderID,ItemID),

  CONSTRAINT PK_OrderItems_Orders
  FOREIGN KEY (OrderID)
  REFERENCES Orders(OrderID),

  CONSTRAINT PK_OrderItems_Items
  FOREIGN KEY (ItemID)
  REFERENCES Items(ItemID)
)

