CREATE TABLE [dbo].[ContactMessages] (
    [ID]          INT            NOT NULL,
    [SenderName]  NVARCHAR (100) NULL,
    [SenderEmail] NVARCHAR (100) NULL,
    [Subject]     NVARCHAR (200) NULL,
    [MessageBody] NVARCHAR (MAX) NULL,
    [ReceivedAt]  DATETIME       NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_ContactMessages_ReceivedAt]
    ON [dbo].[ContactMessages]([ReceivedAt] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ContactMessages_Complaints]
    ON [dbo].[ContactMessages]([ReceivedAt] ASC) WHERE ([Subject]='Pytanie o produkt');


GO
CREATE NONCLUSTERED INDEX [IX_ContactMessages_Question]
    ON [dbo].[ContactMessages]([ReceivedAt] ASC) WHERE ([Subject]='Pytanie o produkt');


GO
CREATE NONCLUSTERED INDEX [IX_ContactMessages_ReceivedAt_Covering]
    ON [dbo].[ContactMessages]([ReceivedAt] ASC)
    INCLUDE([SenderName], [SenderEmail], [Subject]);


GO
CREATE NONCLUSTERED INDEX [IX_ContactMessages_Email_Covering]
    ON [dbo].[ContactMessages]([SenderEmail] ASC)
    INCLUDE([SenderName], [Subject], [ReceivedAt]);

