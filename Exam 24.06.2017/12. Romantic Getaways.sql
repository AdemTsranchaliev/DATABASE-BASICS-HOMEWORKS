SELECT a.Id,a.Email,c.Name,COUNT(t.Id) FROM Accounts AS a
JOIN AccountsTrips AS act
ON act.AccountId=a.Id
JOIN Trips AS t
ON t.Id=act.TripId
JOIN Rooms AS r
ON r.Id=t.RoomId
JOIN Hotels AS h
ON h.Id=r.HotelId
JOIN Cities AS c
ON c.Id=h.CityId
WHERE a.CityId=h.CityId
GROUP BY a.Id,a.Email,c.Name
ORDER BY COUNT(t.Id) DESC,a.Id