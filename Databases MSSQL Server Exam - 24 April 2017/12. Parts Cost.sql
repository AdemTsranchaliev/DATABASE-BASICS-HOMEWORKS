SELECT 
    CASE
	 WHEN SUM(smth.s) IS NULL THEN '0'
		ELSE SUM(smth.s) 
	END
	  FROM Orders AS [order]
  JOIN (SELECT SUM(op.Quantity*p.Price) 
            AS s,op.OrderId 
		  FROM OrderParts AS op 
		  JOIN Parts AS p
		    ON p.PartId=op.PartId 
	 GROUP BY op.OrderId) AS smth 
	        ON smth.OrderId=[order].OrderId
WHERE DATEDIFF(WEEK,[order].IssueDate,'04/24/2017')<=3 









