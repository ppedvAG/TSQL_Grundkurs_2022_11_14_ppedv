--<, >, <=, >= kleiner, größer, kleiner-gleich, größer-gleich
--=, !=, <> gleich, ungleich, auch ungleich
--BETWEEN, IN, LIKE: Zwischen, innerhalb einer Liste
--AND, OR: Bedingungen verbinden
--NOT: Bedingungen invertieren

USE Northwind;

SELECT * FROM Orders WHERE Freight >= 50; --Bestellungen mit Freight mindestens 50

SELECT * FROM Orders WHERE Freight <= 50; --Bestellungen mit Freight 50 oder weniger

SELECT * FROM Orders WHERE Freight >= 50 AND EmployeeID = 4; --Beide Bedingungen müssen wahr sein

SELECT * FROM Orders WHERE Freight >= 50 OR EmployeeID = 1; --Eine von beiden Bedingungen muss wahr sein

SELECT * FROM Orders WHERE Freight BETWEEN 50 AND 100; --Zwischen X und Y (mit Grenzen inkludiert)

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --1, 2 und 3 dabei

SELECT * FROM Orders WHERE OrderDate BETWEEN '19970101' AND '19970630'; --Between mit Datumswerten

SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-06-30'; --In MySQL möglich, hier nicht

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1997; --Funktionen im WHERE benutzen

SELECT * FROM Orders WHERE DATEPART(DAY, OrderDate) = 12;

SELECT * FROM Orders WHERE ShipCountry = 'Austria' OR ShipCountry = 'Germany' OR ShipCountry = 'UK'; --Lang und unübersichtlich

SELECT * FROM Orders WHERE ShipCountry IN('Austria', 'Germany', 'UK'); --Selbiges wie oben nur mit IN

SELECT * FROM Orders WHERE EmployeeID IN (1, 2, 5, 8); --Parameter im IN werden mit OR verknüpft

SELECT * FROM Orders WHERE ShipCountry = 'UK' AND (OrderDate >= '19970101' OR ShippedDate >= '19970101'); --Mit Klammern kann man die Reihenfolge von den einzelnen Prädikaten steuern

SELECT * FROM Customers WHERE Fax = NULL; --NULL Vergleiche funktionieren nicht mit =

SELECT * FROM Customers WHERE Fax IS NULL; --NULL Vergleiche funktionieren nur mit IS

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS NOT NULL um zu schauen welche Datensätze nicht leer sind

SELECT * FROM Orders WHERE OrderDate NOT BETWEEN '19970101' AND '19970630'; --Auch BETWEEN kann invertiert werden

SELECT * FROM Orders WHERE ShipCountry NOT IN('Austria', 'Germany', 'UK'); --Auch IN kann invertiert werden