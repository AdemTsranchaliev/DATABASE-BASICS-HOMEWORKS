CREATE TRIGGER tr_addCloseData ON Reports FOR UPDATE
AS
 BEGIN
	UPDATE Reports
	SET StatusId=3
	WHERE Id IN  ( SELECT Id FROM inserted WHERE  CloseDate IS NOT NULL)
 END


