USE AdventureWorks;

GO
CREATE PROCEDURE Sales.GetDiscountsForCategory
	@Category NVARCHAR(50)
AS
BEGIN
SELECT Description, DiscountPct, Type,
		Category, StartDate, EndDate, MinQty, MaxQty
		FROM Sales.SpecialOffer
		WHERE Category = @Category
		ORDER BY StartDate, EndDate
END

GO
EXEC Sales.GetDiscountsForCategory 'Reseller';