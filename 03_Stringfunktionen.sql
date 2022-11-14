USE Northwind;

SELECT FirstName + ' ' + LastName FROM Employees; --Strings verbinden mit +

SELECT CONCAT(FirstName, ' ', LastName) FROM Employees; --CONCAT: beliebig viele Strings zusammenbauen

SELECT CONCAT_WS(' ', FirstName, LastName) FROM Employees; --CONCAT_WS: Concat with Seperator, baut beliebig viele Strings mit einem Seperator zusammen

SELECT CONCAT_WS(' ', CompanyName, Address, City, PostalCode, Country) FROM Customers;

SELECT TRIM(' Test '); --Alle Abst�nde links und rechts entfernen
SELECT LTRIM(' Test '); --Alle Abst�nde links entfernen
SELECT RTRIM(' Test '); --Alle Abst�nde rechts entfernen

SELECT LOWER('Test'); --Alles Lowercase
SELECT UPPER('Test'); --Alles Uppercase

SELECT LEN('Test'); --LEN: L�nge von einem String zur�ckgeben (4)
SELECT LEN(' Test '); --LEN macht automatisch ein RTRIM (hier 5 Zeichen)
SELECT DATALENGTH(' Test '); --DATALENGTH um RTRIM zu verhindern

SELECT REVERSE('Test'); --Dreht den String um

SELECT UPPER(FirstName), REVERSE(LastName) FROM Employees; --Funktionen auf Spalten anwenden

SELECT LEFT('Testtext', 6); --6 Zeichen von links nehmen
SELECT RIGHT('Testtext', 6); --6 Zeichen von rechts nehmen
SELECT SUBSTRING('Testtext', 2, 4); --Von Zeichen 2 (e) 4 Zeichen nehmen (estt)

SELECT REPLICATE('xyz', 5); --Gibt den String X mal aneinandergeh�ngt zur�ck

SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --STUFF: an einer bestimmten Stelle einen String einbauen
SELECT STUFF('Testtexttest', 2, 7, '_Hallo_'); --�berschreibung m�glich durch dritten Parameter

SELECT REPLACE('Testtext', 'e', '-'); --Ersetze ein oder beliebig viele Zeichen mit anderen Zeichen
SELECT REPLACE('Testtext', 't', '-'); --Gro�-/Kleinschreibung wird hier nicht beachtet (gro�es T wird auch ersetzt)

SELECT CHARINDEX('s', 'Testtext'); --Finde das erste Vorkommen von einem gegebenen Zeichen