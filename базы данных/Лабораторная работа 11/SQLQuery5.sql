/*USE AdventureWorks
GO
SELECT ProductID, Name From Production.Product
WHERE DiscontinuedDate IS NOT NULL*/

/*UPDATE Production.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID = 680*/

INSERT Sales.SalesOrderDetail(
	SalesOrderID, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount)
	VALUES(43660, 5, 680, 1, 1431, 0)