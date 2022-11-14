USE Northwind;

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer in Ländern die mit A anfangen (A und danach beliebig viele Zeichen)

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case-Insensitive

SELECT * FROM Customers WHERE Country LIKE '%A'; --Alle Länder die mit A enden

SELECT * FROM Customers WHERE Country LIKE '%A%'; --A in der Mitte (Andorra fällt auch hinein, da beliebig viele Zeichen auch leer sein können)

SELECT * FROM Customers WHERE Country LIKE '%A%A%'; --Alle Länder die 2 A's in der Mitte haben

SELECT * FROM Customers WHERE City LIKE '_ünchen'; --Nach genau einem beliebigen Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Genau vier beliebige Zeichen suchen

SELECT * FROM Customers WHERE LEN(PostalCode) = 4;

SELECT * FROM Customers WHERE PostalCode LIKE '1___'; --Alle Postleitzahlen finden die mit 1 starten und aus 4 Zeichen bestehen

SELECT * FROM Customers WHERE Country LIKE '[agn]%'; --A, G oder N als erstes Zeichen und danach beliebig viele Zeichen

SELECT * FROM Orders WHERE EmployeeID LIKE '[126]';

SELECT * FROM Customers WHERE ContactName LIKE '[a-d]%'; --Alle Kunden mit Namen von A bis D

SELECT * FROM Customers WHERE ContactName LIKE '[^a-d]%'; --Alle Kunden mit Namen von nicht A bis D

SELECT * FROM Customers WHERE ContactName LIKE '[a-d|x-z]%'; --Ranges verbinden (A bis D und X bis Z)

SELECT * FROM Customers WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --PIN Überprüfung

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Sonderfall: Prozent suchen

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Sonderfall: Hochkomma suchen