SELECT * 
FROM WizzardDeposits


SELECT DepositGroup,AVG(DepositInterest) 
FROM WizzardDeposits
WHERE DepositStartDate>'01/01/1985'
GROUP BY DepositGroup