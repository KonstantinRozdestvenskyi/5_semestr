USE AdventureWorks
SELECT SalesPersonID, Bonus FROM Sales.SalesPerson
	ORDER BY Bonus DESC
SELECT TOP 4 SalesPersonID, Bonus FROM Sales.SalesPerson
	ORDER BY Bonus DESC
SELECT TOP 4 WITH TIES SalesPersonID, Bonus 
	FROM Sales.SalesPerson
	ORDER BY Bonus DESC
