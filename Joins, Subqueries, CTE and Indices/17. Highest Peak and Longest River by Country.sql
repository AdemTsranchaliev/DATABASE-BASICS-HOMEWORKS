SELECT TOP(5) 
       c.CountryName, 
	   MAX(p.Elevation ), 
	   MAX(r.Length)
  FROM Countries AS c
  JOIN MountainsCountries AS mc
    ON mc.CountryCode=c.CountryCode
  JOIN Mountains AS m
    ON m.Id=mc.MountainId
  JOIN Peaks AS p
    ON p.MountainId=mc.MountainId
  JOIN CountriesRivers AS cr
    ON cr.CountryCode=c.CountryCode
  JOIN Rivers AS r
    ON r.Id=cr.RiverId
GROUP BY c.CountryName
ORDER BY MAX(p.Elevation) DESC,
         MAX(r.Length) DESC,
		 c.CountryName ASC
