USE Northwind;

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Ergebnis nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Prim�r: Country, Sekund�r: City)

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> Absteigend, ASC -> Aufsteigend, Standard)

