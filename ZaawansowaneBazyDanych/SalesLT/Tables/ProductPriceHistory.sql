CREATE TABLE [SalesLT].[ProductPriceHistory] (
    [ProductID] INT             NULL,
    [OldPrice]  DECIMAL (12, 2) NULL,
    [NewPrice]  DECIMAL (12, 2) NULL,
    [ChangedAt] DATETIME2 (7)   DEFAULT (sysdatetime()) NULL
);

