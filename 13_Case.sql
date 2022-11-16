USE Northwind;

SELECT *,
	CASE --If/Else Baum
		WHEN Freight > 100 THEN 'Teure Bestellung'
		WHEN Freight <= 100 THEN 'Günstige Bestellung'
	END AS Beschreibung
FROM Orders;

SELECT *,
	CASE
		WHEN Country IN('Germany', 'Austria', 'Switzerland') THEN 'Spricht Deutsch'
		ELSE 'Spricht kein Deutsch' --ELSE am Ende auch möglich
	END
FROM Customers;

SELECT *,
	CASE
		WHEN ShippedDate < RequiredDate THEN 'Vorzeitig angekommen'
		WHEN ShippedDate = RequiredDate THEN 'Rechtzeitig angekommen'
		WHEN ShippedDate > RequiredDate THEN 'Zu spät'
		ELSE 'Noch nicht angekommen' --Für NULL Fälle
	END AS Lieferstatus
FROM Orders
ORDER BY Lieferstatus; --ORDER BY nach der CASE Spalte auch möglich mit Alias

--Wenn der Gesamtpreis für unsere Bestellung > 500$ ist -> 5% Rabatt, 2000$ -> 10%, 5000$ -> 20%
SELECT * FROM [Order Details]
WHERE Quantity * UnitPrice >
CASE
	WHEN Discount >= 0.2 THEN 5000 --Wenn ich in dieses Case hier komme, werden die anderen nicht mehr ausgeführt
	WHEN Discount >= 0.1 THEN 2000
	WHEN Discount >= 0.05 THEN 500
END