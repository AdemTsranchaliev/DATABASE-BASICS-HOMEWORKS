SELECT CONCAT(c.FirstName,' ',c.LastName),
       DATEDIFF(DAY,j.IssueDate,'04/24/2017') AS timeLenght,
	   [Status]
  FROM Clients AS c
  JOIN Jobs AS j
    ON j.ClientId=c.ClientId
 WHERE j.Status != 'Finished'
ORDER BY timeLenght DESC,c.ClientId