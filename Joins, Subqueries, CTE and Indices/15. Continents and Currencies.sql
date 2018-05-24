SELECT cc.ContinentCode,cc.CurrencyCode,cc.cnt FROM (
SELECT c.ContinentCode,c.CurrencyCode,c.cnt,RANK() OVER (PARTITION BY c.ContinentCode ORDER BY c.cnt DESC) AS rankk FROM
 (
SELECT ContinentCode,CurrencyCode,COUNT(CurrencyCode) AS cnt
  FROM Countries
GROUP BY CurrencyCode,ContinentCode 
) AS c
) AS cc
WHERE cc.rankk=1 AND cc.cnt>1


