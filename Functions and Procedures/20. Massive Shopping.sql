DECLARE @UserId INT = (SELECT Id FROM Users WHERE Username='Stamat')
DECLARE @GameId INT = (SELECT Id FROM Games WHERE Name='Safflower')
DECLARE @UserGameId INT =(SELECT Id FROM UsersGames WHERE GameId=@GameId AND @UserId=UserId)
BEGIN TRY
BEGIN TRANSACTION

	UPDATE UsersGames
	SET Cash-=(SELECT SUM(Price) FROM Items WHERE MinLevel IN (11,12))
	WHERE @UserGameId=Id

	IF((SELECT Cash FROM UsersGames WHERE Id=@UserGameId)<0)
	 BEGIN
		ROLLBACK
		RAISERROR('You do not have enough money to buy all items',16,1)
		RETURN
	 END

	INSERT INTO  UserGameItems(ItemId,UserGameId)
	SELECT Id,@UserGameId FROM Items WHERE MinLevel IN (11,12)
	

	COMMIT
	END TRY
	BEGIN CATCH
	ROLLBACK
	END CATCH

	BEGIN TRY
BEGIN TRANSACTION

	UPDATE UsersGames
	SET Cash-=(SELECT SUM(Price) FROM Items WHERE MinLevel IN (19,20,21))
	WHERE @UserGameId=Id

	IF((SELECT Cash FROM UsersGames WHERE Id=@UserGameId)<0)
	 BEGIN
		ROLLBACK
		RAISERROR('You do not have enough money to buy all items',16,2)
		RETURN
	 END

	INSERT INTO  UserGameItems(ItemId,UserGameId)
	SELECT Id,@UserGameId FROM Items WHERE MinLevel IN (19,20,21)

	COMMIT
	END TRY
	BEGIN CATCH
	ROLLBACK
	END CATCH

	SELECT i.Name FROM UserGameItems
	JOIN Items AS i
	ON i.Id=UserGameItems.ItemId
	WHERE UserGameId = @UserGameId
	ORDER BY i.Name 
	