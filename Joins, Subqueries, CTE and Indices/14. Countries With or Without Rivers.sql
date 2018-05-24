SELECT TOP (5)
       c.CountryName,
       r.RiverName
  FROM CountriesRivers AS cr
RIGHT OUTER JOIN Rivers AS r
    ON r.Id=cr.RiverId
RIGHT OUTER JOIN Countries AS c
    ON c.CountryCode=cr.CountryCode
 WHERE c.ContinentCode='AF'
ORDER BY c.CountryName
