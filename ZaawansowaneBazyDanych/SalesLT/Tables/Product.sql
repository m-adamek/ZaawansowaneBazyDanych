CREATE TABLE [SalesLT].[Product] (
    [ProductID]              INT              IDENTITY (1, 1) NOT NULL,
    [Name]                   [dbo].[Name]     NOT NULL,
    [ProductNumber]          NVARCHAR (25)    NOT NULL,
    [Color]                  NVARCHAR (15)    NULL,
    [StandardCost]           MONEY            NOT NULL,
    [ListPrice]              MONEY            NOT NULL,
    [Size]                   NVARCHAR (5)     NULL,
    [Weight]                 DECIMAL (8, 2)   NULL,
    [ProductCategoryID]      INT              NULL,
    [ProductModelID]         INT              NULL,
    [SellStartDate]          DATETIME         NOT NULL,
    [SellEndDate]            DATETIME         NULL,
    [DiscontinuedDate]       DATETIME         NULL,
    [ThumbNailPhoto]         VARBINARY (MAX)  NULL,
    [ThumbnailPhotoFileName] NVARCHAR (50)    NULL,
    [rowguid]                UNIQUEIDENTIFIER CONSTRAINT [DF_Product_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate]           DATETIME         CONSTRAINT [DF_Product_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [CK_Product_ListPrice] CHECK ([ListPrice]>=(0.00)),
    CONSTRAINT [CK_Product_SellEndDate] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL),
    CONSTRAINT [CK_Product_StandardCost] CHECK ([StandardCost]>=(0.00)),
    CONSTRAINT [CK_Product_Weight] CHECK ([Weight]>(0.00)),
    CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID]),
    CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID]),
    CONSTRAINT [AK_Product_Name] UNIQUE NONCLUSTERED ([Name] ASC),
    CONSTRAINT [AK_Product_ProductNumber] UNIQUE NONCLUSTERED ([ProductNumber] ASC),
    CONSTRAINT [AK_Product_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_Product_ProductNumber]
    ON [SalesLT].[Product]([ProductNumber] ASC)
    INCLUDE([ProductID], [ProductCategoryID], [Name], [StandardCost]);


GO

CREATE TRIGGER SalesLT.trg_Product_Update_Price
ON SalesLT.Product 
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON

INSERT INTO SalesLT.ProductPriceHistory(ProductID, OldPrice, NewPrice)
SELECT 
i.ProductID,
d.ListPrice AS OldPrice,
i.ListPrice AS NewPrice

FROM INSERTED i
JOIN DELETED d 
ON i.ProductID = d.ProductID

WHERE ISNULL(d.ListPrice, -1) <> ISNULL(i.ListPrice, -1)
END
GO

CREATE TRIGGER [SalesLT].trg_Product_PriceChange20Percent
ON SalesLT.Product
INSTEAD OF UPDATE
AS
BEGIN
INSERT INTO SalesLT.Log(info)
SELECT
'Próba zwiększenia ceny o więcej niż 20% dla ProductID = ' 
+ CAST(i.ProductID AS NVARCHAR)

FROM INSERTED i
JOIN DELETED d 
ON i.ProductID = d.ProductID
WHERE i.ListPrice > d.ListPrice * 1.2

UPDATE p
SET 
p.Name = i.Name,
p.ListPrice = i.ListPrice
FROM SalesLT.Product p
JOIN INSERTED i 
ON p.ProductID = i.ProductID
JOIN DELETED d
ON i.ProductID = d.ProductID
WHERE i.ListPrice <= d.ListPrice * 1.2
END