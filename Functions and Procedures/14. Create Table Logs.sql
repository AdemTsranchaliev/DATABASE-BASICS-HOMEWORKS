
CREATE TRIGGER tr_Logs ON Accounts FOR UPDATE
AS
 BEGIN
	INSERT INTO Logs(AccountId,OldSum,NewSum)
	SELECT inserted.Id,d.Balance,inserted.Balance FROM inserted
	JOIN deleted AS d
	  ON d.Id=inserted.Id
 END


--CREATE PROC usp_DepositMoney @Id INT, @Money MONEY
-- AS
--  BEGIN
--	UPDATE Accounts
--	SET Balance-=20
--	WHERE Id=1
--  END
--
--EXEC usp_DepositMoney 1, 10
--SELECT * FROM Logs