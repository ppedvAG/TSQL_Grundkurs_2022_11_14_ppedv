USE Northwind;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Prim�rschl�ssel, eindeutige Spalte, kann nicht null sein, h�ufig IDs, mehrere Prim�rschl�ssel m�glich (kombinierter Schl�ssel)
	--identity: Erh�ht die Spalte automatisch um 1, bietet bei ID-Spalten an
	--identity(<Startwert>, <Inkrement>), Starte bei <Startwert>, erh�he um <Inkrement>, identity(5, 3) -> 5, 8, 11, 14, ...
	ID int primary key identity,
	Vorname varchar(20),
	Nachname varchar(20) not null --Feld kann nicht leer sein
);

-------------------------------------------------------------------

--INSERT INTO <Tabelle> VALUES (<Wert1>, <Wert2>, ...), (<Wert1>, <Wert2>, ...), ...
INSERT INTO Test VALUES
('Max', 'Muster');

--Mehrere Datens�tze gleichzeitig einf�gen
INSERT INTO Test VALUES
('Max', 'Muster'),
('Test', 'Test');

--Nur bestimmte Spalten in die Tabelle schreiben
INSERT INTO Customers (CustomerID, CompanyName, Country) VALUES
('PPEDV', 'PPEDV AG', 'DE');

INSERT INTO Test VALUES
('Max', NULL); --NULL nicht m�glich da Nachname NOT NULL
GO

CREATE PROC p_Test
AS
	SELECT FirstName, LastName FROM Employees;
GO

--Ergebnis einer Prozedur in die Tabelle eintragen
INSERT INTO Test
EXEC p_Test;

--Ergebnis eines SELECTs in die Tabelle eintragen
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis eines SELECTs in eine NEUE Tabelle schreiben
SELECT FirstName, LastName INTO #Test
FROM Employees;

------------------------------------------------------------------------

--UPDATE <Tabellenname> SET <Spaltenname> = <Wert>
UPDATE Test SET Nachname = 'Test';

--Bei UPDATE unbedingt WHERE verwenden um nicht alle Daten zu �ndern
UPDATE Customers
SET Country = 'Germany'
WHERE Country = 'DE';

--Wert der jetzt drinnen steht kann im UPDATE noch verwendet werden bevor er ge�ndert wird
UPDATE Test SET Nachname = REPLICATE(Nachname, 3)

--Bei UPDATE bietet es sich an auf die ID der Tabelle zu gehen
UPDATE Customers SET City = 'Burghausen' WHERE CustomerID = 'PPEDV';

-----------------------------------------------------------------

--CREATE SEQUENCE <Name> AS <Typ>
--Standardm��ig (1, 1)
CREATE SEQUENCE TestSeq AS INT;

--N�chsten Wert aus der Sequenz entnehmen, Sequenz wird um <Inkrement> erh�ht
SELECT NEXT VALUE FOR TestSeq;

CREATE SEQUENCE TestSeq AS INT
START WITH 230000 --Rechnungsnummern f�r 2023 (bis 10000 Rechnungen)
INCREMENT BY 1;

INSERT INTO Test VALUES
(NEXT VALUE FOR TestSeq, 'Test'); --N�chsten Wert bei INSERT einf�gen

--Sequenz zur�cksetzen
ALTER SEQUENCE TestSeq RESTART WITH 230000;

----------------------------------------------------------------------

--DELETE FROM <Tabelle>
--L�scht alle Daten ohne WHERE
DELETE FROM Test;

DELETE FROM Test
WHERE ID > 10;

--TRUNCATE l�scht alle Daten aus der Tabelle
--Programmierer hat absichtlich alle Daten l�schen wollen da kein WHERE m�glich
TRUNCATE TABLE Test;

---------------------------------------------------------------------

CREATE TABLE FKTest
(
	TestID int primary key identity,
	Name varchar(20)
);

CREATE TABLE PKTest
(
	ID int identity,
	Vorname varchar(20),
	Nachname varchar(20),
	Geburtsdatum date,
	FK_ID int, --Muss den selben Typen wie der Schl�ssel in der anderen Tabelle haben

	CONSTRAINT PK_ID PRIMARY KEY(ID),

	CONSTRAINT FK_PKTest_FKTest
	FOREIGN KEY(FK_ID) --Fremdschl�sselspalte ausw�hlen
	REFERENCES FKTest(TestID), --Spalte in der anderen Tabelle ausw�hlen

	--Check Constraint: �berpr�ft vor einer �nderung ob die �nderung m�glich ist
	CONSTRAINT CHK_GebDatMin CHECK (YEAR(Geburtsdatum) >= 1900)
)

--Nicht m�glich, da kein Datensatz in der anderen Tabelle mit ID 1
INSERT INTO PKTest VALUES
('Test', 'Test', '20000101', 1);

--Zuerst muss die ID in der anderen Tabelle existieren
INSERT INTO FKTest VALUES
('Test')

--Mit JOIN Abh�ngigkeit aufl�sen
SELECT ID, Vorname, Nachname, Geburtsdatum, Name FROM PKTest p
INNER JOIN FKTest f
ON p.FK_ID = f.TestID;

--Check Constraint verletzt
INSERT INTO PKTest VALUES
('Test', 'Test', '18000101', 1);

-------------------------------------------------------------------------

SELECT * FROM INFORMATION_SCHEMA.TABLES; --Alle Tabellen und Views anzeigen
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'; --Alle Tabellen anzeigen

SELECT * FROM INFORMATION_SCHEMA.COLUMNS; --Alle Spalten der Datenbank anzeigen
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Customers'; --Alle Spalten einer Tabelle anzeigen