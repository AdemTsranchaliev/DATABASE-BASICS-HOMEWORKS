SELECT TOP 5
       CountryName,
 CASE
  WHEN PeakName IS NULL THEN '(no highest peak)'
  WHEN PeakName IS NOT NULL THEN PeakName
 END AS [PeakName],
 CASE
  WHEN Elevation IS NULL THEN 0
  WHEN Elevation IS NOT NULL THEN Elevation
 END,
 CASE
  WHEN MountainRange IS NULL THEN '(no mountain)'
  WHEN MountainRange IS NOT NULL THEN MountainRange
 END
FROM
(
SELECT CountryName,PeakName,Elevation,MountainRange,DENSE_RANK() OVER(PARTITION BY CountryName ORDER BY Elevation DESC) AS rankk 
FROM
(
SELECT c.CountryName,p.PeakName,p.Elevation,m.MountainRange
  FROM Countries AS c
  LEFT OUTER JOIN MountainsCountries AS mc
    ON c.CountryCode=mc.CountryCode
  LEFT OUTER JOIN Mountains AS m
    ON m.Id=mc.MountainId
  LEFT OUTER JOIN Peaks AS p
    ON p.MountainId=m.Id
  ) AS a1
  ) AS a2 
 WHERE rankk=1
ORDER BY CountryName,[PeakName]