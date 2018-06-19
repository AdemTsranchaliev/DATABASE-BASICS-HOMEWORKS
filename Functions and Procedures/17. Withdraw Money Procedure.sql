CREATE PROC usp_WithdrawMoney @AccountId INT, @MoneyAmount DECIMAL(16,4)
AS
 BEGIN
	IF(@MoneyAmount<=0)
	 BEGIN
	  RETURN;
	 END
	UPDATE Accounts
	SET Balance-=@MoneyAmount
	WHERE @AccountId=Id
	IF(@@ROWCOUNT<>1)
	 BEGIN
		ROLLBACK;
	 END
 END

 --EXEC dbo.usp_DepositMoney 1,10