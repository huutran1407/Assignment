create database PRJ_Assignment_OldButGold

use PRJ_Assignment_OldButGold

create table category(
	Category_Id nvarchar(255) NOT NULL UNIQUE,
	Category nvarchar(255),
	Category_SampleIMG text,

	PRIMARY KEY (Category_Id)
)

create table Users(
	UserId varchar(255) NOT NULL UNIQUE,
	UserName varchar(255) NOT NULL UNIQUE,
	User_FullName nvarchar(255),
	Password varchar(255) NOT NULL,
	isAdmin int DEFAULT 0,
	Email varchar(255),
	Contact varchar(255),
	DisplayName nvarchar(255),
	Banned int DEFAULT 0,
	joinDate datetime DEFAULT CURRENT_TIMESTAMP,
	User_Avatar varchar(255)

	Primary key (UserId),
)

create table Product(
	Pro_Id varchar(255) NOT NULL UNIQUE,
	Pro_Name nvarchar(255),
	Pro_Quantity int,
	Pro_Type nvarchar(255),
	Pro_Seller varchar(255),
	Pro_img text,
	Pro_description ntext,
	Pro_Price float,
	Pro_AddDate datetime DEFAULT CURRENT_TIMESTAMP,
	Pro_Status int DEFAULT 1

	Primary key (Pro_Id),
	FOREIGN KEY (Pro_Type) REFERENCES category(Category_Id),
	FOREIGN KEY (Pro_Seller) REFERENCES Users(UserId)
)

create table ordered(
	Order_Owner varchar(255) NOT NULL,
	OrderId varchar(255) NOT NULL UNIQUE,
	OrderTotalPrice float,
	OrderDate datetime DEFAULT CURRENT_TIMESTAMP,
	PaymentMode varchar(255),
	CustomerName varchar(255),
	MobileNumber varchar(255),
	Address varchar(255)

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Order_Owner) REFERENCES Users(UserId)
)

create table Order_Detail(
	OrderId varchar(255) NOT NULL,
	Product_Id varchar(255) NOT NULL,
	Product_Quantity int

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Product_Id) REFERENCES Product(Pro_Id),
	FOREIGN KEY (OrderId) REFERENCES ordered(OrderId) 
)

create table Rate(
	UserId varchar(255) NOT NULL,
	ProductId varchar(255) NOT NULL,
	Rate float,
	RateMess text
	
	PRIMARY KEY (UserId,ProductId),
	FOREIGN KEY (ProductId) REFERENCES Product(Pro_Id),
	FOREIGN KEY (UserId) REFERENCES Users(UserId)
)

create table Follow(
	UserId varchar(255),
	FollowedId varchar(255)

	PRIMARY KEY (UserId,FollowedId),
	FOREIGN KEY (UserId) REFERENCES Users(UserId),
	FOREIGN KEY (FollowedId) REFERENCES Users(UserId)
)

create table UserCart(
	UserId varchar(255),
	Pro_Id varchar(255),
	Pro_Quantity int

	PRIMARY KEY (UserId,Pro_Id),
	FOREIGN KEY (UserId) REFERENCES Users(UserId),
	FOREIGN KEY (Pro_Id) REFERENCES Product(Pro_Id)
)

create table PaymentCard(
	UserId varchar(255),
	CardOwner nvarchar(255) NOT NULL,
	CardNumber varchar(255) NOT NULL,
	CardExpMonth int,
	CardExpYear int,
	CVC varchar(3)

	PRIMARY KEY (UserId),
	FOREIGN KEY (UserId) REFERENCES Users(UserId)
)
