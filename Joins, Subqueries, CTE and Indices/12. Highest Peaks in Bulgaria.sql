SELECT mc.CountryCode,
       m.MountainRange,
	   p.PeakName,
	   p.Elevation    
  FROM MountainsCountries as mc
  JOIN Mountains as m
  ON m.Id=mc.MountainId
  JOIN Peaks as p
  ON p.MountainId=mc.MountainId
WHERE mc.CountryCode='BG' AND p.Elevation>2835
ORDER BY p.Elevation DESC



  


