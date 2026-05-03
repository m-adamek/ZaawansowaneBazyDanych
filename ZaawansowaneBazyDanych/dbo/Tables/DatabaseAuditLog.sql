CREATE TABLE [dbo].[DatabaseAuditLog] (
    [LogID]     INT            IDENTITY (1, 1) NOT NULL,
    [info]      NVARCHAR (MAX) NULL,
    [ChangedBy] [sysname]      DEFAULT (suser_sname()) NOT NULL,
    [ChangedAt] DATETIME2 (7)  DEFAULT (sysdatetime()) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

