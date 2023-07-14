create trigger BanUser
ON Users
AFTER UPDATE
AS
BEGIN
	Update Product
	SET Pro_Status = 0
	Where Pro_Seller = (select UserId from inserted where Banned = 1);

	Update Product
	SET Pro_Status = 1
	Where Pro_Seller = (select UserId from inserted where Banned = 0);
END