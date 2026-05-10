CREATE FUNCTION Student_1.ufn_PriceCheck
(
@CategoryName NVARCHAR(50),
@PriceToCheck MONEY
)

RETURNS TABLE 
AS 
RETURN
(
SELECT 
p.ProductID,
p.Name,
p.ListPrice,

Student_1.ufn_IsPriceHigherThanCurrent
(
(
SELECT
p.ProductID,
@PriceToCheck AS ListPrice 
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER   --generowanie format json dla każdego wiersza
)
) AS IsHigherThanCurrent

FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc
ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = @CategoryName

)