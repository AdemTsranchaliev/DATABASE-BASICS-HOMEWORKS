SELECT FirstName,LastName,FORMAT(BirthDate,'MM-dd-yyyy'),s.Name,Email FROM Accounts AS a
JOIN Cities AS s
ON s.Id=a.CityId
WHERE Email LIKE 'e%'
ORDER BY s.Name DESC

