USE [MusicShopDb]

SELECT * FROM Виробники
UNION SELECT * FROM Виробники2

SELECT * FROM Виробники
 WHERE Виробники.[Код]  IN (SELECT [Код] FROM Виробники2);

 SELECT * FROM Виробники
 WHERE Виробники.[Код] NOT IN (SELECT [Код] FROM Виробники2);

 SELECT * FROM Виробники, Виробники2;