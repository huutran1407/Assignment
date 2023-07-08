Create trigger UpdateProduct
ON Product
AFTER UPDATE
AS
BEGIN
	Update Product
	SET Pro_Status = 0
	Where Pro_Quantity = 0;
END