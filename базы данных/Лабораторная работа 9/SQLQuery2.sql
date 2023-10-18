USE AdventureWorks;

IF OBJECT_ID ('Sales.GetDiscountsForDate', 'FN') IS NOT NULL
	DROP FUNCTION Sales.GetDiscountsForDate
GO
CREATE FUNCTION Sales.GetDiscountsForDate (@DateToCheck datetime)
	RETURNS table
	AS
	RETURN(SELECT Description, DiscountPct, Type, Category, StartDate, EndDate, MinQty, MaxQty
		FROM Sales.SpecialOffer
		WHERE @DateToCheck BETWEEN StartDate AND EndDate);

GO
SELECT * FROM Sales.GetDiscountsForDate(GETDATE());




