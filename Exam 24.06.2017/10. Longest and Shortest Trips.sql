SELECT a.Id,CONCAT(a.FirstName,' ',a.LastName) AS s,MAX(DATEDIFF(DAY,ArrivalDate,ReturnDate)) AS [Long Trip],MIN(DATEDIFF(DAY,ArrivalDate,ReturnDate)) FROM Accounts AS a
JOIN AccountsTrips AS act
ON act.AccountId=a.Id
JOIN Trips AS t
ON t.Id=act.TripId
WHERE t.CancelDate IS NULL AND a.MiddleName IS NULL
GROUP BY a.Id,CONCAT(a.FirstName,' ',a.LastName)
ORDER BY [Long Trip] DESC,a.Id

