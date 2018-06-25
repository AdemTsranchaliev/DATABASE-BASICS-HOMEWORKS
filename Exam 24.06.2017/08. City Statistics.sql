SELECT c.Name,ISNULL(COUNT(h.Id),0) AS a FROM Cities AS c
FULL JOIN Hotels AS h
ON h.CityId=c.Id
GROUP BY c.Name
ORDER BY a DESC,c.Name