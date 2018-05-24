SELECT COUNT(*)
 FROM MountainsCountries as mc
 RIGHT OUTER JOIN Countries as c
 ON c.CountryCode=mc.CountryCode
 WHERE mc.MountainId IS NULL


