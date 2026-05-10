
CREATE FUNCTION Student_1.ufn_IsPriceHigherThanCurrent
(
    @ProductJson NVARCHAR(MAX)
)
RETURNS BIT

AS
BEGIN

DECLARE @ProductID INT
DECLARE @JsonPrice MONEY
DECLARE @CurrentPrice MONEY

SET @ProductID = JSON_VALUE(@ProductJson, '$.ProductID')
SET @JsonPrice = JSON_VALUE(@ProductJson, '$.ListPrice')

SELECT
@CurrentPrice = ListPrice
FROM SalesLT.Product
WHERE ProductID = @ProductID

IF @JsonPrice > @CurrentPrice
RETURN 1

RETURN 0

END