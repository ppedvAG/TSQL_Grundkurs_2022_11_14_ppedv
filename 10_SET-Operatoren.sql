USE Northwind;

SELECT 'Test1', 'Test2'; --Zwei Spalten

SELECT 'Test1'
UNION
SELECT 'Test2'; --Einzelne Spalte durch UNION

--UNION
--Beide SELECTs die selben Spalten ausgeben (Datentypen)
--Gleich viele Spalten
--Filtert Duplikate

SELECT * FROM Customers;
SELECT * FROM Suppliers;

SELECT CompanyName FROM Customers
UNION
SELECT CompanyName FROM Suppliers; --Alle CompanyNames in einer Spalte

SELECT CompanyName FROM Customers
UNION
SELECT Address FROM Suppliers; --Nur Typen müssen gleich sein, nicht Namen

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName FROM Customers; --Unterschiedlich viele Spalten möglich

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName, NULL FROM Suppliers; --Mit NULL oder '' fehlende Spalten ergänzen

SELECT CustomerID FROM Customers
UNION
SELECT SupplierID FROM Suppliers; --Unterschiedliche Typen nicht möglich

SELECT CustomerID FROM Customers
UNION
SELECT CONVERT(VARCHAR, SupplierID) FROM Suppliers; --Einzelne Spalten konvertieren in den anderen Typen

SELECT CompanyName, ContactName, Address, Phone FROM Customers
UNION
SELECT CompanyName, ContactName, Address, Phone FROM Suppliers; --Sinnvolle Spalten auswählen

SELECT Phone FROM Customers
UNION
SELECT Phone FROM Suppliers
UNION
SELECT HomePhone FROM Employees; --Mehr als zwei Tabellen mit UNION kombinieren

SELECT Country FROM Customers
INTERSECT
SELECT Country FROM Employees; --INTERSECT: Daten die in beiden Tabellen vorkommen

SELECT Country FROM Customers
EXCEPT
SELECT Country FROM Employees; --EXCEPT: Daten die in der ersten Tabelle vorkommen, aber nicht in der zweiten

SELECT * FROM Umsatz2019
UNION ALL --UNION ALL: Keine Duplikate filtern wie bei UNION
SELECT * FROM Umsatz2020
UNION ALL
SELECT * FROM Umsatz2021; --UNION: 547ms CPU, 1174ms, UNION ALL: 15ms, 1092ms
GO

CREATE VIEW v_Gesamtumsatz
AS
	SELECT * FROM Umsatz2019
	UNION ALL
	SELECT * FROM Umsatz2020
	UNION ALL
	SELECT * FROM Umsatz2021;
GO --View erstellen aus UNION ALL Tabellen

--Auf Gesamtumsatz zugreifen mit Zwischengespeichertem UNION Block
SELECT * FROM v_Gesamtumsatz WHERE Umsatz > 900;
SELECT * FROM v_Gesamtumsatz ORDER BY Umsatz DESC;
SELECT YEAR(Datum), SUM(Umsatz) FROM v_Gesamtumsatz GROUP BY YEAR(Datum);