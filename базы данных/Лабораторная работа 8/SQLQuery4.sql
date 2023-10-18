USE AdventureWorks;

/*GO
CREATE PROCEDURE Sales.AddDiscount
	(
	@Description NVARCHAR(255),
	@DiscountPct SMALLMONEY,
	@Type NVARCHAR(50),
	@Category NVARCHAR(50),
	@StartDate DATETIME,
	@EndDate DATETIME,
	@MinQty INT,
	@MaxQty INT,
	@NewProductID INT OUTPUT
	)
AS
BEGIN TRY
	INSERT INTO Sales.SpecialOffer (Description, DiscountPct, Type, Category, StartDate, EndDate, MinQty, MaxQty)
	VALUES
		(@Description, @DiscountPct, @Type, @Category, @StartDate, @EndDate, @MinQty, @MaxQty);
	SET @NewProductID = SCOPE_IDENTITY()
	END TRY
BEGIN CATCH
	INSERT dbo.ErrorLog VALUES(GETDATE(), USER_NAME(), ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_PROCEDURE(),
		ERROR_LINE(), ERROR_MESSAGE());
END CATCH;*/

/*GO
DECLARE @StartDate datetime, @EndDate datetime
SET @StartDate = GETDATE()
SET @EndDate = DATEADD(month, 1, @StartDate)
DECLARE @NewId int
EXEC Sales.AddDiscount
'Half price off everything',
0.5,
'Seasonal Discount',
'Customer',
@StartDate,
@EndDate,
0,
20,
@NewId OUTPUT
SELECT @NewId*/

GO
DECLARE @StartDate datetime, @EndDate datetime
SET @StartDate = GETDATE()
SET @EndDate = DATEADD(month, 1, @StartDate)
DECLARE @NewId int, @ReturnValue int
EXEC @ReturnValue = Sales.AddDiscount
'Half price off everything',
-0.5,
'Seasonal Discount',
'Customer',
@StartDate,
@EndDate,
0,
20,
@NewId OUTPUT
IF (@ReturnValue = 0)
	SELECT @NewId
ELSE
	SELECT TOP 1 * FROM dbo.ErrorLog ORDER BY ErrorTime DESC