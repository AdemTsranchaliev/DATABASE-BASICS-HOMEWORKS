SELECT CONCAT(FirstName,' ',LastName) 
  FROM Mechanics 
 WHERE MechanicId  NOT IN (SELECT MechanicId FROM Jobs WHERE FinishDate IS NULL GROUP BY MechanicId)
ORDER BY MechanicId
