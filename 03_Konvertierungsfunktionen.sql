USE Northwind;

SELECT CAST(GETDATE() AS date); --Datetime zu einem Date konvertieren (Zeit fällt weg)

SELECT CAST(GETDATE() AS time); --Datetime zu einem Time konvertieren (Datum fällt weg)

SELECT HireDate, CAST(HireDate AS date) FROM Employees; --Cast auf Tabellenspalten anwenden

SELECT '123' + 3; --'123' wird automatisch zu int konvertiert

SELECT '123.4' + 3; --Konvertierung funktioniert nicht automatisch bei decimal

SELECT CAST('123.4' AS float) + 3; --Kommazahl

SELECT CAST('123.4' AS decimal(4, 2)) + 3; --4 Gesamtstellen davon 2 Kommastellen

SELECT CAST('2022-11-14' AS date); --Datumsstring konvertieren

SELECT CAST('14.11.2022' AS date); --Auf Formatierung aufpassen

SELECT CAST('14/11/2022' AS datetime); --Mit datetime auch noch Zeit hinzufügen

------------------------------------------------------------

SELECT CONVERT(date, '2022-11-14'); --CONVERT: selbiges wie Cast nur andere Schreibweise

--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(varchar, GETDATE(), 4); --14.11.22
SELECT CONVERT(varchar, GETDATE(), 104); --14.11.2022

------------------------------------------------------------

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); --2022-11-14

SELECT FORMAT(GETDATE(), 'yy-MM-dd'); --22-11-14

SELECT FORMAT(GETDATE(), 'yy yyyy MMM MMMM ddd dddd'); --Monate/Tage kurz und lang schreiben

SELECT FORMAT(GETDATE(), 'd'); --Kurzes schönes Datum

SELECT FORMAT(GETDATE(), 'D'); --Langes schönes Datum

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönstes Datum

SELECT FORMAT(12345, 'Die Zahl ist #');

SELECT FORMAT(12345, 'Die ersten 4 Zahlen sind: #, die letzte Zahl ist #');

SELECT FORMAT(HireDate, 'D') FROM Employees; --Einstellige Tage
SELECT FORMAT(HireDate, 'dddd, dd. MMMM yyyy') FROM Employees; --Zweistellige Tage