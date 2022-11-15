USE Northwind;

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --Anzahl Customer aus UK (7)

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl einzigartiger (verschiedener) L�nder (22)

SELECT
MAX(Freight) AS TeuersteBestellung,
MIN(Freight) AS BilligsteBestellung,
AVG(Freight) AS Durchschnittskosten,
SUM(Freight) AS Gesamtkosten
FROM Orders;

SELECT TOP 1 Freight FROM Orders ORDER BY Freight; --Billigste
SELECT TOP 1 Freight FROM Orders ORDER BY Freight DESC; --Teuerste

SELECT AVG(Freight) FROM Orders WHERE Freight > 50; --Mit WHERE die Berechnung noch weiter eingrenzen (78.24 -> 155.62)

---------------------------------------------------------------------------------

SELECT * FROM Orders ORDER BY EmployeeID; --1er Gruppe (10258, 10270, 10275, ...), 2er Gruppe (11073, 11070, 11060, ...)

SELECT * FROM Orders GROUP BY EmployeeID; --Nicht m�glich

SELECT EmployeeID FROM Orders GROUP BY EmployeeID; --Alle Spalten die ausgegeben werden sollen m�ssen im GROUP BY sein oder Aggregatsfunktionen sein

SELECT EmployeeID, COUNT(*) AS AnzBestellungen FROM Orders GROUP BY EmployeeID; --Anzahl Bestellungen pro Mitarbeiter

SELECT 
EmployeeID,
COUNT(*) AS AnzBestellungen,
AVG(Freight) AS Durchschnittsfrachtkosten,
SUM(Freight) AS Gesamtfrachtkosten
FROM Orders 
GROUP BY EmployeeID 
ORDER BY AnzBestellungen DESC; --Aggregatsfunktionen k�nnen auf die einzelnen Gruppen angewandt werden

SELECT
Country,
COUNT(*) AS AnzKunden
FROM Customers
GROUP BY Country
ORDER BY AnzKunden DESC;

SELECT
Country,
City,
COUNT(*) AS AnzKunden
FROM Customers 
GROUP BY Country, City --Nach mehreren Spalten gruppieren
ORDER BY AnzKunden DESC;

SELECT Country, City, COUNT(*)
FROM Customers
GROUP BY Country, City
ORDER BY COUNT(*) DESC; --Aggregatsfunktionen auch im ORDER BY m�glich

---------------------------------------------------------------------------------

--WHERE vs GROUP BY + HAVING
--WHERE filtert vorher
--HAVING filtert Gruppen (nach WHERE)

SELECT CustomerID, COUNT(*) AS AnzBestellungen
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 10 --Gruppen einschr�nken auf bestimmtes Kriterium
ORDER BY AnzBestellungen DESC;

SELECT CustomerID, COUNT(*) AS AnzBestellungen
FROM Orders
WHERE OrderID < 10500 --WHERE kommt vor HAVING
GROUP BY CustomerID
HAVING COUNT(*) >= 10 --Gruppen einschr�nken auf bestimmtes Kriterium
ORDER BY AnzBestellungen DESC;

SELECT CustomerID, COUNT(*) AS AnzBestellungen
FROM Orders
GROUP BY CustomerID
HAVING AVG(Freight) > 50 --Alle Aggregatsfunktionen m�glich
ORDER BY AnzBestellungen DESC;

SELECT
--c.CustomerID,
c.CompanyName, --�ber JOIN CompanyName holen
COUNT(*) AS AnzBestellungen,
SUM(Freight) AS Freight
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName --Um ID und Name auszugeben m�ssen beide Spalten im GROUP BY stehen
ORDER BY AnzBestellungen DESC; --c.CompanyName hier kostenlos, da CustomerID bereits eindeutig ist