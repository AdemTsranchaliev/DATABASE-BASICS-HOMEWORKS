SELECT SUM([DIFF])
FROM 
(SELECT  DepositAmount-LEAD(DepositAmount) OVER (ORDER BY ID ASC) AS DIFF FROM WizzardDeposits)
AS DD

