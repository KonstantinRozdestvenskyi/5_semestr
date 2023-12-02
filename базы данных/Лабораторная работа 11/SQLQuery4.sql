USE AdventureWorks
GO
IF OBJECT_ID('Sales.OrderDetailNotDiscontinued','TR') IS NOT NULL
DROP TRIGGER Sales.OrderDetailNotDiscontinued

USE AdventureWorks

GO
CREATE TRIGGER OrderDetailNotDiscontinued ON Sales.SalesOrderDetail
AFTER INSERT, UPDATE
AS
IF ((SELECT p.DiscontinuedDate FROM Production.Product p
INNER JOIN inserted i ON i.ProductID = p.ProductID) IS NOT NULL)
BEGIN
	DECLARE @errmsg varchar(100)
	SET @errmsg = 'Tried to order discontinued product! Reverting operation.'
	RAISERROR(@errmsg, 1, 1)
	ROLLBACK TRANSACTION
END