
CREATE   TRIGGER trg_Database_TableAudit
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN

SET NOCOUNT ON

DECLARE @Event XML = EVENTDATA()

INSERT INTO dbo.DatabaseAuditLog (info)
SELECT 
'Event: ' + @Event.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(max)') +
', Object: ' + @Event.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(max)') +
', Schema: ' + @Event.value('(/EVENT_INSTANCE/SchemaName)[1]', 'NVARCHAR(max)')
END