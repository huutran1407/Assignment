use PRJ_Assignment_OldButGold

create table category(
	Category_Id int NOT NULL UNIQUE,
	Category varchar(255),
	Category_SampleIMG text,

	PRIMARY KEY (Category_Id)
)

create table Users(
	UserId int NOT NULL UNIQUE,
	UserName varchar(255) NOT NULL,
	User_FullName varchar(255),
	Password varchar(255) NOT NULL,
	isAdmin int,
	Contact varchar(255),

	Primary key (UserId),
)

create table Product(
	Pro_Id int NOT NULL UNIQUE,
	Pro_Name varchar(255),
	Pro_Quantity int,
	Pro_Type int,
	Pro_Seller int,
	Pro_img text,
	Pro_description text,
	Pro_Price float,

	Primary key (Pro_Id),
	FOREIGN KEY (Pro_Type) REFERENCES category(Category_Id),
	FOREIGN KEY (Pro_Seller) REFERENCES Users(UserId)
)

create table ordered(
	Order_Owner int NOT NULL,
	OrderId int NOT NULL UNIQUE,

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Order_Owner) REFERENCES Users(UserId)
)

create table Order_Detail(
	OrderId int NOT NULL,
	Product_Id int NOT NULL,
	Product_Quantity int,
	Order_Date date NOT NULL,
	OrderEnd_Date date,

	PRIMARY KEY (OrderId),
	FOREIGN KEY (Product_Id) REFERENCES Product(Pro_Id),
	FOREIGN KEY (OrderId) REFERENCES ordered(OrderId) 
)

