SELECT CountryCode,COUNT(*)  AS c
  FROM MountainsCountries as ms
WHERE ms.CountryCode IN ('BG','US','RU')
GROUP BY ms.CountryCode
