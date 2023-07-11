create trigger UpdateCart
On UserCart
AFTER UPDATE
AS
BEGIN
	DELETE FROM UserCart
	WHERE Pro_Quantity = 0;
END