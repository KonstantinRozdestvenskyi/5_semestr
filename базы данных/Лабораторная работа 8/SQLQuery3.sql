USE AdventureWorks

GO
CREATE PROCEDURE Sales.GetDiscountsForCategoryAndDate
	@Category NVARCHAR(50),
	@DateToCheck DATETIME = NULL
AS
BEGIN
	IF (@DateToCheck = NULL)
		SET @DateToCheck = GETDATE();
	SELECT Description, DiscountPct, Type, Category, StartDate, EndDate, MinQty, MaxQty
		FROM Sales.SpecialOffer
		WHERE Category = @Category AND @DateToCheck BETWEEN StartDate AND EndDate
		ORDER BY StartDate, EndDate
END

GO
--EXEC Sales.GetDiscountsForCategoryAndDate 'Reseller';
DECLARE @DateToCheck datetime;
SET @DateToCheck = DateAdd(month, 1, GetDate());
EXEC Sales.GetDiscountsForCategoryAndDate 'Reseller', @DateToCheck;