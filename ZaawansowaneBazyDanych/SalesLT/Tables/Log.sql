CREATE TABLE [SalesLT].[Log] (
    [LogID] INT            IDENTITY (1, 1) NOT NULL,
    [info]  NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

