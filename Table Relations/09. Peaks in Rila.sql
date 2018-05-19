SELECT m.MountainRange, p.PeakName, p.Elevation 
FROM Mountains AS M
JOIN Peaks AS P 
ON P.MountainId=m.Id
WHERE m.MountainRange='Rila'
ORDER BY p.Elevation DESC

