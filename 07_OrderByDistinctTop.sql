USE Northwind;

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Ergebnis nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Primär: Country, Sekundär: City)

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> Absteigend, ASC -> Aufsteigend, Standard)

SELECT * FROM Customers ORDER BY 2; --Nach Spaltenindex sortieren (hier CompanyName)

SELECT CompanyName, ContactName, Address, Phone FROM Customers ORDER BY 2;

SELECT * FROM Customers ORDER BY 9, 6; --Sortierung nach mehreren Spalten mit Indizes

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS FullName FROM Employees ORDER BY FullName; --Nach Spaltenalias sortieren

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS [Full Name] FROM Employees ORDER BY [Full Name]; --Nach Spaltenalias mit Abstand sortieren

-------------------------------------------------------------------------------

SELECT Country FROM Customers ORDER BY 1; --Duplikate

SELECT DISTINCT Country
FROM Customers ORDER BY 1; --Keine Duplikate mehr, 91 -> 22 Datensätze

SELECT DISTINCT Country, City
FROM Customers ORDER BY 1; --Kombination von Duplikaten entfernen

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(*) FROM Customers WHERE CompanyName LIKE 'A%'; --Anzahl der Customer mit Firmennamen die mit A anfangen

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl der einzigartigen Länder

------------------------------------------------------------------------------

SELECT TOP 10 *
FROM Orders; --Obersten 10 Datensätze der Tabelle (nicht aussagekräftig)

SELECT TOP 10 * FROM Orders ORDER BY Freight; --Die 10 günstigsten Bestellungen

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --Die 10 teuersten Bestellungen

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight; --Gibt die obersten 2% des Ergebnisses aus (2% der Tabelle -> 17 Datensätze)

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight DESC; --Die Top 2% der teuersten Bestellungen

SELECT TOP 5 PERCENT
CustomerID,
CompanyName,
ContactName,
Phone,
City
FROM Customers
ORDER BY City;  --Sinnvolle Spalten auswählen

SELECT * FROM [Order Details] ORDER BY Quantity; --Kleinsten Bestellungen

SELECT TOP 1 PERCENT * 
FROM [Order Details] ORDER BY Quantity; --Nicht alle Bestellungen mit 2 Quantity sichtbar

SELECT TOP 4 PERCENT * 
FROM [Order Details] ORDER BY Quantity; --Hier auch schon 3 dabei

SELECT TOP 1 PERCENT WITH TIES *
FROM [Order Details] ORDER BY Quantity; --Alle Datensätze mit Quantity 2 sind jetzt dabei