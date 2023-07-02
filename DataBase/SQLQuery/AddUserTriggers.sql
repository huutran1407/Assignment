CREATE trigger AddDate
ON Users
AFTER insert
AS
BEGIN
	Declare @isAdmin int;
	IF (select UserId from inserted) LIKE 'AD%'
		BEGIN
		SET @isAdmin = 1;
		END
	ELSE
		BEGIN
		SET @isAdmin = 0;
		END

	UPDATE Users
	SET joinDate = CURRENT_TIMESTAMP,
		isAdmin = @isAdmin,
		Banned = 0
	Where UserId = (select UserId from inserted);
END
