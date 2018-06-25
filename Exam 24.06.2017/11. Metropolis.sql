SELECt TOP(5) c.Id,c.Name,c.CountryCode,COUNT(a.CityId) FROM Accounts AS a
JOIN Cities AS c
ON c.Id=a.CityId
GROUP BY c.Id,c.Name,c.CountryCode
ORDER BY COUNT(a.CityId) DESC
