

CREATE   PROCEDURE [236731].ProcessTopProducts
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO #Summary
    (
        ProductID,
        ProductName,
        OriginalPrice,
        ModifiedPrice
    )

    SELECT
        ProductID,
        Name,
        ListPrice,
        (ListPrice - (ListPrice * 0.01))

    FROM #TopProducts

END