--Kommentar wird nicht ausgeführt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank auswählen

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Test'; --Text mit ''
--Markieren, Strg + E -> Einzelnes Statement ausführen

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Wird als Text interpretiert

--Strg + R: Ergebnisansicht schließen

SELECT 100 AS Zahl; --AS: Spalte einen Namen geben

SELECT 100 AS Zahl, 'Test' AS Text; --Mehrere Werte ausgeben

SELECT 10.5; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Block auskommentieren
--Strg + K, U: Block einkommentieren
--Alt + Pfeiltaste: Derzeitige Zeile verschieben

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Bestimmte Spalten auswählen

SELECT CompanyName, ContactName FROM Customers; --Bestimmte Spalten auswählen

SELECT Freight * 2 FROM Orders; --Berechnungen auf Spalten durchführen

SELECT Freight % 5 FROM Orders; --Modulo-Operator (%): Rest einer Division

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unschön)

SELECT CompanyName + ' ' + Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse]
FROM Customers; --Strings verbinden mit Abständen, Namen mit Abständen müssen mit [] oder "" angegeben werden
--Umbrüche beliebig möglich