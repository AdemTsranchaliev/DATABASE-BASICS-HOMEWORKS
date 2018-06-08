CREATE PROC usp_TransferMoney @SenderId INT, @ReceiverId INT, @Amount DECIMAL(16,4)
AS
 BEGIN
	BEGIN TRANSACTION
	 IF(@Amount <=0)
	  BEGIN
		RAISERROR('The amount must to be positive',16,1)
		RETURN
	  END
	 UPDATE Accounts
	 SET Balance-=@Amount
	 WHERE Id=@SenderId
	 IF(@@ROWCOUNT<>1)
	  BEGIN
	    ROLLBACK
	    RAISERROR('Error',16,2)
		RETURN
	  END
	 UPDATE Accounts
	 SET Balance+=@Amount
	 WHERE Id=@ReceiverId
	 IF(@@ROWCOUNT<>1)
	  BEGIN
	    ROLLBACK
	    RAISERROR('Error',16,2)
		RETURN
	  END	
	COMMIT
 END
 
	--EXEC dbo.usp_TransferMoney 5,1,5000