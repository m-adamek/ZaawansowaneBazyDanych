CREATE TABLE [SalesLT].[VendorComplaints] (
    [ComplaintID]     INT           IDENTITY (1, 1) NOT NULL,
    [VendorID]        INT           NOT NULL,
    [ProductID]       INT           NOT NULL,
    [ComplaintDate]   DATETIME      NOT NULL,
    [ComplaintNotes]  VARCHAR (200) NULL,
    [ComplaintStatus] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_VendorComplaints] PRIMARY KEY CLUSTERED ([ComplaintID] ASC),
    CONSTRAINT [FK_VendorComplaints_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_VendorComplaints_Vendor] FOREIGN KEY ([VendorID]) REFERENCES [SalesLT].[Vendor] ([VendorID])
);


GO
CREATE NONCLUSTERED INDEX [IX_VendorComplaints_Success]
    ON [SalesLT].[VendorComplaints]([VendorID] ASC) WHERE ([ComplaintStatus]='Resolved successfully');


GO
CREATE NONCLUSTERED INDEX [IX_VendorComplaints_Unresolved]
    ON [SalesLT].[VendorComplaints]([ProductID] ASC)
    INCLUDE([VendorID], [ComplaintDate], [ComplaintStatus]);

