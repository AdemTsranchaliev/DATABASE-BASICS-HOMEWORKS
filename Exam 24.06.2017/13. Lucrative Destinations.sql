SELECT c.Name,SUM(r.Price)+SUM(h.BaseRate) FROM Cities AS c
JOIN Hotels AS h
ON h.CityId=c.Id
JOIN Rooms AS r
ON r.HotelId=h.Id
JOIN Trips AS t
ON t.Id=r.Id
JOIN AccountsTrips AS acnt
ON acnt.TripId=t.Id
GROUP BY c.Name,h.Id



SELECT t.RoomId FROM Trips AS t
JOIN AccountsTrips AS acnt
ON acnt.TripId=t.Id
GROUP BY t.RoomId