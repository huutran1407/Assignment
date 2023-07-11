create trigger UpdateProduct
ON Product
AFTER UPDATE
AS
BEGIN
	Update Product
	SET Pro_Status = 0
	Where Pro_Quantity = 0;

	DELETE FROM UserCart
	WHERE Pro_Id = (SELECT Pro_Id from Product Where Pro_Status = 0);

	UPDATE UserCart
	SET Pro_Quantity = (select Pro_Quantity from inserted)
	where Pro_Id = (select Pro_Id from inserted) AND Pro_Quantity > (select Pro_Quantity from inserted);
END