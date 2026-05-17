CREATE   PROCEDURE [236731].SearchCustomer
(
    @FirstName     NVARCHAR(50) = NULL,
    @LastName      M1_surname = NULL,
    @CustomerID    INT = NULL,
    @EmailAddress  NVARCHAR(100) = NULL
)
AS
BEGIN

    SET NOCOUNT ON

    SELECT
        CustomerID,
        FirstName,
        LastName,
        EmailAddress,
        Phone,
        CompanyName
    FROM [236731].Customer
    WHERE
        (@FirstName IS NULL OR FirstName = @FirstName)
        AND (@LastName IS NULL OR LastName = @LastName)
        AND (@CustomerID IS NULL OR CustomerID = @CustomerID)
        AND (@EmailAddress IS NULL OR EmailAddress = @EmailAddress)

END