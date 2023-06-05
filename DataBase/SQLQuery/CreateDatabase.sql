create database PRJ_Assignment_OldButGold

use PRJ_Assignment_OldButGold

create table category(
	Category_Id int NOT NULL UNIQUE,
	Category nvarchar(255),
	Category_SampleIMG text,

	PRIMARY KEY (Category_Id)
)

create table Users(
	UserId varchar(255) NOT NULL UNIQUE,
	UserName varchar(255) NOT NULL UNIQUE,
	User_FullName nvarchar(255),
	Password varchar(255) NOT NULL,
	isAdmin int,
	Email varchar(255),
	Contact varchar(255),
	DisplayName nvarchar(255)

	Primary key (UserId),
)

create table Product(
	Pro_Id varchar(255) NOT NULL UNIQUE,
	Pro_Name nvarchar(255),
	Pro_Quantity int,
	Pro_Type int,
	Pro_Seller varchar(255),
	Pro_img text,
	Pro_description ntext,
	Pro_Price float,

	Primary key (Pro_Id),
	FOREIGN KEY (Pro_Type) REFERENCES category(Category_Id),
	FOREIGN KEY (Pro_Seller) REFERENCES Users(UserId)
)

create table ordered(
	Order_Owner varchar(255) NOT NULL,
	OrderId varchar(255) NOT NULL UNIQUE,

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Order_Owner) REFERENCES Users(UserId)
)

create table Order_Detail(
	OrderId varchar(255) NOT NULL,
	Product_Id varchar(255) NOT NULL,
	Product_Quantity int,
	Order_Date date NOT NULL,
	OrderEnd_Date date,

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Product_Id) REFERENCES Product(Pro_Id),
	FOREIGN KEY (OrderId) REFERENCES ordered(OrderId) 
)


