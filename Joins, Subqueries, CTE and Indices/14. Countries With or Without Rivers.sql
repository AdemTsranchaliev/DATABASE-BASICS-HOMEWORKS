SELECT CountryCode,
       COUNT(*) 
  FROM MountainsCountries as ms
 WHERE ms.CountryCode IN ('BG','US','RU')
GROUP BY ms.CountryCode


  
