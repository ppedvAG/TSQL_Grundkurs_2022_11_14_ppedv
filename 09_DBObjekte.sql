USE Northwind;
GO

--CREATE VIEW <Name> AS <SQL-Statement> GO
--Statischer Snapshot eines Teils der Datenbank
--v_ um Views von restlichen Objekten der Datenbank zu differenzieren
--kein ORDER BY

CREATE VIEW v_Countries
AS
	SELECT Country FROM Customers;
GO

SELECT * FROM v_Countries; --View ansprechen mit SELECT (hier WHERE und ORDER BY möglich)

SELECT * FROM v_Countries WHERE Country LIKE 'A%' ORDER BY 1;

DROP VIEW v_Countries; --View löschen
GO

CREATE VIEW v_Countries
AS
	SELECT DISTINCT Country FROM Customers;
GO

DROP VIEW IF EXISTS v_Countries; --IF EXISTS um zu prüfen ob die View existiert
GO

DROP VIEW v_Chefs;
GO

CREATE VIEW v_Chefs
AS
	SELECT 
	e.EmployeeID AS EmpID,
	CONCAT_WS(' ', e.FirstName, e.LastName) AS EmpName,
	chef.EmployeeID AS ChefID,
	CONCAT_WS(' ', chef.FirstName, chef.LastName) AS ChefName
	FROM Employees chef
	RIGHT JOIN Employees e
	ON chef.EmployeeID = e.ReportsTo;
GO

SELECT * FROM v_Chefs;
GO

---------------------------------------------------------------------------------

--CREATE PROCEDURE <Name> AS <SQL-Statement(s)> GO
--p_ um Prozeduren von restlichen Objekten der Datenbank zu differenzieren
--Fixes Verhalten auf Datenbankebene speichern

CREATE PROCEDURE p_CountriesCities
AS
	SELECT DISTINCT Country, City FROM Customers;
GO

EXECUTE p_CountriesCities; --EXECUTE <Name> um eine Prozedur auszuführen
GO

--Prozedur mit Parameter(n)

--@<Name> <Typ>, ...
CREATE PROC p_OrdersFromTo @StartDate date, @EndDate date --Zwei Parameter (@StartDate, @EndDate)
AS
	SELECT * FROM Orders WHERE OrderDate BETWEEN @StartDate AND @EndDate;
GO

EXEC p_OrdersFromTo @StartDate = '19970101', @EndDate = '19970131'; --Parameter müssen hier übergeben werden
GO

p_CountriesCities; --Prozedur ohne EXECUTE/EXEC ausführen
GO

DROP PROC p_CountriesCities;

--------------------------------------------------------------------------------------

SELECT * FROM Customers; --Permanente Daten

--SELECT INTO: Ergebnis eines SELECTs in eine neue Tabelle schreiben

SELECT Country, City
INTO Test --Daten in eine neue normale Tabelle einfügen
FROM Customers;

--Temporäre Tabellen: Ergebnis eines SELECTs temporär abspeichern, werden gelöscht wenn der Ersteller der Tabelle die Verbindung trennt
SELECT Country, City
INTO #Test --Temporäre Tabelle mit # am Anfang
FROM Customers;

SELECT * FROM #Test;

--Globale temporäre Tabellen mit ##
SELECT Country, City
INTO ##Test --Wird gelöscht, wenn alle User die darauf zugegriffen haben die Verbindung getrennt haben
FROM Customers;

SELECT * FROM ##Test;