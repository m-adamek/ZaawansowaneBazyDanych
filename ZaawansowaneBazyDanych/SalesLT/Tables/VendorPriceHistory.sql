CREATE TABLE [SalesLT].[VendorPriceHistory] (
    [QuoteID]   BIGINT   NULL,
    [VendorID]  INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [Price]     MONEY    NOT NULL,
    [QuoteDate] DATETIME NOT NULL
);


GO
CREATE CLUSTERED INDEX [IX_VendorPriceHistory_Vendor_Product_Date]
    ON [SalesLT].[VendorPriceHistory]([VendorID] ASC, [ProductID] ASC, [QuoteDate] ASC) WITH (FILLFACTOR = 25);


GO
CREATE NONCLUSTERED INDEX [IX_VendorPriceHistory_ProductID_QuoteDate]
    ON [SalesLT].[VendorPriceHistory]([ProductID] ASC, [QuoteDate] ASC);

