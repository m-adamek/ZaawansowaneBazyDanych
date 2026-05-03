CREATE TABLE [SalesLT].[ProductVersions] (
    [ProductID]       INT NOT NULL,
    [ParentProductID] INT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    FOREIGN KEY ([ParentProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

