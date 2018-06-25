SELECT CONCAT(m.FirstName,' ',m.LastName),
       AVG(DATEDIFF(DAY,MchStartTimeAndFinished.IssueDate,MchStartTimeAndFinished.FinishDate)) 
  FROM Mechanics AS m
  JOIN (SELECT j.MechanicId,IssueDate,FinishDate FROM Jobs AS j WHERE FinishDate IS NOT NULL) AS MchStartTimeAndFinished 
    ON MchStartTimeAndFinished.MechanicId=m.MechanicId
GROUP BY CONCAT(m.FirstName,' ',m.LastName),m.MechanicId
ORDER BY m.MechanicId
