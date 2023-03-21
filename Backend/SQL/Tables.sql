CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(10) NOT NULL,
    Address VARCHAR(200),
	Type VARCHAR(20),
	Status INT,
	CreatedON DATETIME
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
	Manufacturer VARCHAR(500),
    Description VARCHAR(500),
    Price DECIMAL(10, 2) NOT NULL,
	Discount DECIMAL(10, 2),
	Quantity INT NOT NULL,
	ExpDate DATETIME,
	Status INT,
    ImageUrl VARCHAR(200) NOT NULL
);

CREATE TABLE Cart (
    CartId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	Discount DECIMAL(10, 2),
    Quantity INT NOT NULL,
	TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users (UserId),
    FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
	OrderNo VARCHAR(20),
    TotalPrice DECIMAL(10, 2) NOT NULL,
    ShippingAddress VARCHAR(200) NOT NULL,
    OrderDate DATETIME NOT NULL,
	OrderStatus VARCHAR(20),
    FOREIGN KEY (UserId) REFERENCES Users (UserId)
);

CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
	Discount DECIMAL(10, 2),
	TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders (OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);


SELECT * FROM Users
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderItems
SELECT * FROM Cart
