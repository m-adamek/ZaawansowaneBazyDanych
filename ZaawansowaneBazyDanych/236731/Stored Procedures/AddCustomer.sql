CREATE   PROCEDURE [236731].AddCustomer
(
    @FirstName     NVARCHAR(50),
    @LastName      M1_surname,
    @EmailAddress  NVARCHAR(100),
    @Phone         NVARCHAR(25)
)
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF SalesLT.IsLastNameUnique(@LastName) = 0
    BEGIN
        THROW 50001, 'Last name already exists.', 1;
    END

    INSERT INTO [236731].Customer
    (
        NameStyle,
        FirstName,
        LastName,
        EmailAddress,
        Phone,
        PasswordHash,
        PasswordSalt,
        rowguid,
        ModifiedDate
    )
    VALUES
    (
        0,
        @FirstName,
        @LastName,
        @EmailAddress,
        @Phone,
        'HASH',
        'SALT',
        NEWID(),
        GETDATE()
    )

END