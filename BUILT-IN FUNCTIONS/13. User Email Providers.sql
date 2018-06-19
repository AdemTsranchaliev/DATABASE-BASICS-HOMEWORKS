SELECT  Username,
       SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)-CHARINDEX(Email,'@')) 
  FROM Users
  ORDER BY SUBSTRING(Email,CHARINDEX('@',Email),LEN(Email)-CHARINDEX(Email,'@'))  ASC, Username