USE Northwind;

--Alle Order die teuer als der Durchschnitt sind
DECLARE @Average float = (SELECT AVG(Freight) FROM Orders); --Mit separater Variable
SELECT * FROM Orders WHERE Freight > @Average;

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders); --Mit Unterabfrage, wichtig: einzelner Wert als Ergebnis

SELECT * FROM Orders
WHERE Freight > (SELECT TOP 1 Freight FROM Orders); --Durch TOP 1 kommt auch genau ein Wert heraus

SELECT * FROM Orders
WHERE Freight >= (SELECT Freight FROM Orders WHERE Freight > 1000) --Hier kommt zufälligerweise genau ein Wert heraus

SELECT * FROM Customers
WHERE Country IN(SELECT DISTINCT Country FROM Employees); --Subselect kann auch im IN sein, alle Datensätze werden in das IN eingefügt

SELECT Freight, (SELECT AVG(Freight) FROM Orders)
FROM Orders ORDER BY Freight; --Subselect im SELECT

SELECT *
FROM
(
	SELECT 
	Orders.EmployeeID,
	Orders.Freight,
	Employees.FirstName + ' ' + Employees.LastName AS FullName --Alle inneren Spalten brauchen einen Namen
	FROM Orders
	INNER JOIN Employees
	ON Orders.EmployeeID = Employees.EmployeeID
) AS Ergebnis --Bei Subselect im FROM muss das FROM einen Alias mit AS haben
WHERE Ergebnis.Freight > 50 --Inneres SELECT filtern
ORDER BY Ergebnis.EmployeeID; --Inneres SELECT sortieren

SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%'); --EXISTS gibt nur true/false zurück

SELECT * FROM Customers
WHERE NOT EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%'); --Wenn true -> alle Zeilen sonst keine Zeilen