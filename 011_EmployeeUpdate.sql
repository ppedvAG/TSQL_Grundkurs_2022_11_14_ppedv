USE Northwind;
GO

ALTER TABLE Employees ADD Salary MONEY; --Salary Spalte hinzufügen
GO

--Salaries hinzufügen
UPDATE Employees SET Salary = 2500 WHERE EmployeeID = 1;
UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 2;
UPDATE Employees SET Salary = 1800 WHERE EmployeeID = 3;
UPDATE Employees SET Salary = 5000 WHERE EmployeeID = 4;
UPDATE Employees SET Salary = 3200 WHERE EmployeeID = 5;
UPDATE Employees SET Salary = 3100 WHERE EmployeeID = 6;
UPDATE Employees SET Salary = 2300 WHERE EmployeeID = 7;
UPDATE Employees SET Salary = 2800 WHERE EmployeeID = 8;
UPDATE Employees SET Salary = 3000 WHERE EmployeeID = 9;

SELECT * FROM Employees; --Ergebnis anschauen