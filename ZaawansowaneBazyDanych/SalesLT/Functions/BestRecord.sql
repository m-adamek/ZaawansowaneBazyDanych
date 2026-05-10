
CREATE FUNCTION SalesLT.BestRecord(
@Color NVARCHAR(50) = 'Red',
@MaxPrice MONEY = 1431.50,
@ModifiedDate DATETIME = '2008-03-11'
)
RETURNS INT
AS
BEGIN

DECLARE @Result int

SELECT TOP 1 @result = [ProductID]


FROM dbo.[236731_Order]
where
ListPrice <= @MaxPrice AND
ModifiedDate >= @ModifiedDate AND
Color = @Color

ORDER BY ListPrice DESC

RETURN @result

END