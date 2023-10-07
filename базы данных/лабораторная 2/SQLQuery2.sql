USE AdventureWorks
--SELECT COUNT(*) AS 'Count' FROM HumanResources.Employee
/*SELECT COUNT(ManagerID) AS 'Mananger Count' 
	FROM HumanResources.Employee*/
/*SELECT ProductID, SUM(OrderQty) AS Sum_Count FROM Sales.SalesOrderDetail
	GROUP BY ProductID*/
/*SELECT ProductID, SUM(OrderQty) AS Sum_Count FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY Sum_Count*/
/*SELECT ProductID, SUM(OrderQty) AS Sum_Count FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING SUM(OrderQty) >= 2000*/
/*SELECT ProductID, SpecialOfferID, AVG(UnitPrice) AS 'Average Price', SUM(LineTotal) AS 'Sum Line' 
	FROM Sales.SalesOrderDetail
	GROUP BY SpecialOfferID, ProductID
	ORDER BY ProductID*/


