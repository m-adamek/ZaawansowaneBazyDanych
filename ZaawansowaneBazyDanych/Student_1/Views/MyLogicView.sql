
CREATE VIEW Student_1.MyLogicView AS
SELECT top 100
p.ProductID,
p.Name,
p.StandardCost,
p.ListPrice,
(p.ListPrice - p.StandardCost) AS Difference
FROM SalesLT.Product p
ORDER BY (p.ListPrice - p.StandardCost) DESC