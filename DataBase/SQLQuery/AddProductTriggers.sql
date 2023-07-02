CREATE trigger AddProductDate
ON Product
AFTER insert
AS
BEGIN
	UPDATE Product
	SET Pro_AddDate = CURRENT_TIMESTAMP
	Where Pro_Id = (select Pro_Id from inserted);
END
