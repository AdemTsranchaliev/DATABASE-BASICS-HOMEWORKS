SELECT PeakName,RiverName,
CONCAT(LOWER(SUBSTRING(PeakName,1,LEN(PeakName))),LOWER(SUBSTRING(RiverName,2,LEN(RiverName)-1))) AS [Mix]
FROM Peaks,Rivers
WHERE RIGHT(PeakName,1)=LEFT(RiverName,1)
ORDER BY [Mix]