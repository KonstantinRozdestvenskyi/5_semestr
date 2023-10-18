USE AdventureWorks;

IF OBJECT_ID ('Sales.GetMaximumDiscountForCategory', 'FN') IS NOT NULL
	DROP FUNCTION Sales.GetMaximumDiscountForCategory
GO
CREATE FUNCTION Sales.GetMaximumDiscountForCategory (@Category NVARCHAR(50))
RETURNS SMALLMONEY
AS
BEGIN
    RETURN (SELECT MAX(DiscountPct) FROM Sales.SpecialOffer WHERE Category =
		@Category AND GETDATE() >= StartDate AND GETDATE() <= EndDate);
END;
GO
SELECT Sales.GetMaximumDiscountForCategory('Reseller') AS MaxDiscPtc;
