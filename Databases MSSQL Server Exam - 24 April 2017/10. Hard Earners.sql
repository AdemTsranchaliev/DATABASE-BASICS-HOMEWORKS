SELECT TOP(3) 
       CONCAT(m.FirstName,' ',m.LastName),
       COUNT(jobs.JobId) AS cnt FROM Mechanics AS m
  JOIN (SELECT * FROM Jobs WHERE Status!='Finished') AS jobs ON jobs.MechanicId=m.MechanicId
GROUP BY m.MechanicId,CONCAT(m.FirstName,' ',m.LastName)
HAVING COUNT(jobs.JobId)>1
ORDER BY cnt DESC,m.MechanicId ASC