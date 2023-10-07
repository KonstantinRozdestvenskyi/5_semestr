USE AdventureWorks
SELECT SalesQuota, SUM(SalesYTD) AS 'TotalSalesYTD' FROM Sales.SalesPerson
	GROUP BY SalesQuota
SELECT SalesQuota, SUM(SalesYTD) AS 'TotalSalesYTD' FROM Sales.SalesPerson
	GROUP BY GROUPING SETS(ROLLUP(SalesQuota))
SELECT ProductID, SUM(LineTotal) AS 'Total'
	FROM Sales.SalesOrderDetail
	WHERE UnitPrice < 5.00
	GROUP BY ProductID, OrderQTY WITH CUBE


SELECT SalesPersonID, CustomerID, OrderDate, SubTotal, TotalDue 
	FROM Sales.SalesOrderHeader
	ORDER BY SalesPersonID, OrderDate
