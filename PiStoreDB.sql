CREATE DATABASE PiStoreDB;
GO

USE PiStoreDB;
GO

CREATE TABLE Employee (
	EmployeeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeName VARCHAR(100) NOT NULL,
	EmployeeEmail VARCHAR(100) NULL,
	EmployeePhone VARCHAR(10) NULL,
	EmployeeAddress VARCHAR(255) NULL,
	EmployeeSalary INT,
	HireDate DATE NOT NULL,
)
GO

/*CLIENT*/
CREATE TABLE Client (
	ClientID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ClientName VARCHAR(100) NOT NULL,
	ClientEmail VARCHAR(100) NULL,
	ClientPhone VARCHAR(10) NULL,
	ClientAddress VARCHAR(255) NULL,
)
GO


/*PRODUCT*/
CREATE TABLE Product (
	ProductID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ProductName VARCHAR(100) NOT NULL,
	ProductDescription VARCHAR(255) NULL,
	ProductPrice INT,
	Quantity INT NULL
)
GO

/*ORDERS*/
CREATE TABLE Orders(
	OrderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ClientID INT NOT NULL,
	EmployeeID INT NOT NULL,
	OrderDate DATE NOT NULL,
	TotalPrice INT,
	CONSTRAINT FK_Order_Client FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
	CONSTRAINT FK_Order_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
)
GO

/*ORDER ITEM*/
CREATE TABLE OrderItem (
	OrderItemID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NULL,
	CONSTRAINT FK_OrderItem_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT FK_OrderItem_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
)

/*BILL*/
CREATE TABLE Bill (
	BillID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	OrderID INT NOT NULL,
	ClientID INT NOT NULL,
	EmployeeID INT NOT NULL,
	BillDate DATE NOT NULL,
	TotalPrice INT,
	CONSTRAINT FK_Bill_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT FK_Bill_Client FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
	CONSTRAINT FK_Bill_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
)

/*ACCOUNT*/
CREATE TABLE Account(
	[Username] NVARCHAR(250) NOT NULL PRIMARY KEY,
	[Password] NVARCHAR(250) NOT NULL,
)

INSERT Account ([Username],[Password]) VALUES (N'admin', N'123456')

