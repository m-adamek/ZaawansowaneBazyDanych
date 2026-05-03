
CREATE VIEW SalesLT.v_Product AS
SELECT
p.ProductID,
p.ListPrice,
js.NewPrice,
js.NewPrice - p.ListPrice AS Difference
FROM SalesLT.Product p INNER JOIN
OPENJSON(N'
[
    { "ProductID": 680, "NewPrice": 12.30 },
    { "ProductID": 710, "NewPrice": 89.90 },
    { "ProductID": 711, "NewPrice": 240.21 },
    { "ProductID": 712, "NewPrice": 84.99 },
    { "ProductID": 713, "NewPrice": 49.25 }
]')
WITH (
    ProductID int '$.ProductID',
    NewPrice DECIMAL (10,2) '$.NewPrice'
) js
ON p.ProductID = js.ProductID