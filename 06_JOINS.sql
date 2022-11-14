USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Spalten auswählen die in beiden Tabellen sind

SELECT 
Employees.EmployeeID, --Ambiguous column name EmployeeID (in Orders und in Employees ist eine EmployeeID enthalten)
FirstName,
LastName,
Freight,
ShipName,
ShipAddress
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Sinnvolle Spalten auswählen

SELECT 
e.EmployeeID,
FirstName + ' ' + LastName AS FullName,
Freight,
ShipName,
ShipAddress
FROM Orders AS o --Alias mit AS
INNER JOIN Employees e --Alias ohne AS
ON o.EmployeeID = e.EmployeeID; --Alias: Tabelle einen Namen geben um weniger Code zu tippen

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Orders und Customer kombinieren

SELECT 
o.OrderID,
o.Freight,
o.OrderDate,
o.CustomerID,
c.CompanyName,
c.ContactName,
c.Phone,
CONCAT_WS(' ', c.Address, c.City, c.PostalCode, c.Country) AS FullAddress --Funktionen auch im SELECT möglich
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Sinnvolle Spalten auswählen

SELECT * FROM Customers c
JOIN Orders o --INNER kann weggelassen werden
ON c.CustomerID = o.CustomerID; --Tabellen im FROM und im JOIN vertauschen um die Ausgabe umzudrehen

SELECT * FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID; --JOIN mehr als 2 Tabellen

SELECT 
o.OrderID,
od.ProductID,
p.ProductName,
p.QuantityPerUnit,
od.UnitPrice,
od.Quantity,
o.Freight
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID; --Sinnvolle Spalten bei JOIN mit 3 Tabellen

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --830 Datensätze

SELECT * FROM Orders o
RIGHT JOIN Customers c --Beachtet auch Datensätze die kein Match auf der anderen Seite haben (Customer die keine Order getätigt haben)
ON o.CustomerID = c.CustomerID; --832 Datensätze

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID; --Customer und Order vertauschen damit Customer links sind

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Customer finden die kein Order haben

SELECT * FROM Orders CROSS JOIN [Order Details]; --Bildet das Kreuzprodukt von beiden Tabellen