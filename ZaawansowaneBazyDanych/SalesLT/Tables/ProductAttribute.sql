CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductID] INT                                          NOT NULL,
    [Info]      XML(CONTENT [dbo].[ProductAttributesSchema]) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [fk_ProductAttribute_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

