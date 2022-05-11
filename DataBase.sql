CREATE DATABASE SHOPPING
USE SHOPPING
CREATE TABLE [tblUsers](
	[userID] VARCHAR(50) NOT NULL,
	[fullName] NVARCHAR(25) NOT NULL,
	[password] NVARCHAR(25) NOT NULL,
	[roleID] VARCHAR(5) NOT NULL,
	[address] NVARCHAR(250) NOT NULL,
	[birthday] DATE NOT NULL,
	[phone] INT NOT NULL,
	[email] VARCHAR(50) NOT NULL,
	[status] VARCHAR(10) NOT NULL
	)

CREATE TABLE [tblRoles](
	[roleID] VARCHAR(5) NOT NULL,
	[roleName] VARCHAR(10) NOT NULL
	)

CREATE TABLE [tblOrder](
	[orderID] INT IDENTITY(1,1) NOT NULL,
	[orderDate] DATE NOT NULL,
	[total] FLOAT NOT NULL,
	[userID] VARCHAR(50)  NOT NULL,
	[status] VARCHAR(10) NOT NULL
	)

CREATE TABLE [tblOrderDetail](
	[detailID] INT IDENTITY(1,1)NOT NULL,
	[price] FLOAT NOT NULL,
	[quantity] INT NOT NULL,
	[orderID] INT NOT NULL,
	[productID] VARCHAR(11) NOT NULL,
	) 


CREATE TABLE [tblProduct](
	[productID] VARCHAR(11) NOT NULL,
	[productName] NVARCHAR(100) NOT NULL,
	[image] TEXT NOT NULL,
	[price] FLOAT NOT NULL,
	[quantity] INT NOT NULL ,
	[catagoryID] VARCHAR(11) NOT NULL,
	[importDate] DATE NOT NULL,
	[usingDate] DATE NOT NULL,
	[status] VARCHAR(10) NOT NULL
	)

CREATE TABLE [tblCategory](
	[catagoryID] VARCHAR(11) NOT NULL,
	[catagoryName] NVARCHAR(100) NOT NULL
	)
------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE [tblRoles] 
	ADD CONSTRAINT PK_tblRoles 
	PRIMARY KEY ([roleID]);
ALTER TABLE [tblCategory]
	ADD CONSTRAINT PK_tblCategory
	PRIMARY KEY ([catagoryID]);
ALTER TABLE [tblUsers]
	ADD CONSTRAINT PK_tblUsers
	PRIMARY KEY ([userID]),
	CONSTRAINT FK_tblUsers
	FOREIGN KEY ([roleID]) REFERENCES [tblRoles]([roleID]);
ALTER TABLE [tblProduct]
	ADD CONSTRAINT PK_tblProduct
	PRIMARY KEY ([productID]),
	CONSTRAINT FK_tblProduct
	FOREIGN KEY ([catagoryID]) REFERENCES [tblCategory]([catagoryID]);
ALTER TABLE [tblOrder]
	ADD CONSTRAINT PK_tblOrder
	PRIMARY KEY ([orderID]),
	CONSTRAINT FK_tblOrder
	FOREIGN KEY ([userID]) REFERENCES [tblUsers]([userID]);
ALTER TABLE [tblOrderDetail]
	ADD CONSTRAINT PK_tblOrderDetail
	PRIMARY KEY ([detailID]),
	CONSTRAINT FK_tblOrderDetail
	FOREIGN KEY ([orderID]) REFERENCES [tblOrder]([orderID]),
	FOREIGN KEY ([productID]) REFERENCES [tblProduct]([productID]);
