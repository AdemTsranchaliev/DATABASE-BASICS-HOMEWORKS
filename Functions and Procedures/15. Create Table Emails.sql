--CREATE TABLE NotificationEmails
--(
-- Id INT IDENTITY PRIMARY KEY,
-- Recipient INT NOT NULL,
-- FOREIGN KEY (Recipient) REFERENCES Accounts(Id),
-- Subject VARCHAR(40) NOT NULL,
-- Body VARCHAR(100) NOT NULL
--)
--GO

CREATE TRIGGER tr_ChangeInLogs ON Logs FOR INSERT
AS
 BEGIN
	INSERT INTO NotificationEmails(Recipient,Subject,Body)
	SELECT inserted.AccountId,'Balance change for account: '+CONVERT(VARCHAR,inserted.AccountId),'On '+CONVERT(VARCHAR,GETDATE())+' your balance was changed from '+CONVERT(VARCHAR,inserted.NewSum)+' to '+CONVERT(VARCHAR,inserted.OldSum)+'.' FROM inserted
 END

--EXEC usp_DepositMoney 1, 10
--SELECT * FROM NotificationEmails