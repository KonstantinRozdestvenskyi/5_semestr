USE AdventureWorks;

IF OBJECT_ID ('Sales.GetDiscountedProducts', 'TF') IS NOT NULL
	DROP FUNCTION Sales.GetDiscountedProducts
GO
CREATE FUNCTION Sales.GetDiscountedProducts(@IncludeHistory bit) RETURNS @retVal
	TABLE (
			ProductID int NOT NULL, Name nvarchar(50), ListPrice money,
			DiscountDescription nvarchar(255), DiscountPercentage smallmoney, DiscountAmount
			money, DiscountedPrice money)
BEGIN
INSERT INTO @retVal SELECT PP.ProductID, PP.Name,
		PP.ListPrice, SPO.Description, SPO.DiscountPct,
		PP.ListPrice * SPO.DiscountPct as DiscountAmt, (ListPrice - pp.ListPrice *
		SPO.DiscountPct) as DiscountPrice
	FROM Sales.SpecialOffer AS SPO
		INNER JOIN Sales.SpecialOfferProduct AS SOP ON SPO.SpecialOfferID =
		SOP.SpecialOfferID INNER JOIN Production.Product AS PP ON SOP.ProductID =
		PP.ProductID
	WHERE (@IncludeHistory = 1)
		OR (@IncludeHistory = 0 AND SPO.EndDate >= GETDATE() AND SPO.StartDate <=GETDATE())
	ORDER BY pp.ProductID ASC
RETURN
END;

GO
SELECT * FROM Sales.GetDiscountedProducts(0)
--SELECT * FROM Sales.GetDiscountedProducts(1)
