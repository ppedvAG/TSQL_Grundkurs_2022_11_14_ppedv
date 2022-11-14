USE Northwind;

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau

SELECT SYSDATETIME(); --Jetztiges Datum, Nanosekundengenau

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

--YEAR/MONTH/DAY
SELECT YEAR(GETDATE()); --Das Jahr vom heutigen Datum
SELECT MONTH(GETDATE()); --Das Monat vom heutigen Datum
SELECT DAY(GETDATE()); --Den Tag vom heutigen Datum

SELECT YEAR(HireDate) AS Jahr FROM Employees; --Datumsfunktion auf eine Spalte anwenden

SELECT DATEPART(MINUTE, GETDATE()); --Teil von einem Datum holen (selbe Funktionsweise wie YEAR/MONTH/DAY nur flexibel)

SELECT DATEPART(DAYOFYEAR, GETDATE()); --Heutigen Tag finden (1-366)
SELECT DATEPART(WEEKDAY, GETDATE()); --Heutigen Wochentag finden (1-7)
SELECT DATEPART(QUARTER, GETDATE()); --Heutiges Quartal finden (1-4)

SELECT DATEPART(DAYOFYEAR, HireDate) FROM Employees; --DATEPART auf Spalte anwenden

SELECT DATEDIFF(YEAR, 2000, GETDATE()); --2000 wird als Tage interpretiert seit 01.01.1900 -> 24.06.1905
SELECT DATEDIFF(YEAR, '2000-01-01', GETDATE()); --Datumswerte nach ISO-8601
SELECT DATEDIFF(YEAR, '2000', GETDATE()); --Funktioniert auch mit Jahr als String

--Bei Datumswerten immer ISO Datum benutzen (YYYY-MM-DD)

SELECT DATEDIFF(YEAR, '01.01.2000', GETDATE()); --Funktioniert auch
SELECT DATEDIFF(YEAR, '01/01/2000', GETDATE()); --Funktioniert auch

SELECT DATENAME(MONTH, GETDATE()); --Gibt den übersetzten Namen von dem gewünschten Intervall aus
SELECT DATENAME(WEEKDAY, GETDATE()); --Montag

SELECT DATENAME(WEEKDAY, HireDate) FROM Employees; --Schönen Wochentag vom Einstelldatum

SELECT DATEADD(YEAR, 2, GETDATE()); --Ein Intervall auf ein Datum aufaddieren

SELECT DATEADD(DAY, 20, GETDATE()); --Überschläge werden beachtet

SELECT DATEADD(DAY, 730, GETDATE()); --Schaltjahre werden beachtet

SELECT DATEADD(YEAR, -2, GETDATE()); --Negative Werte eingeben um zurückzugehen

SELECT DATEADD(QUARTER, 3, GETDATE()); --Quartale addieren