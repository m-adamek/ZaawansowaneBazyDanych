CREATE   FUNCTION SalesLT.IsLastNameUnique
(
    @LastName M1_surname
)
RETURNS BIT
AS
BEGIN

    DECLARE @NameExists BIT

    SELECT @NameExists =
    (
        SELECT TOP 1 1
        FROM [236731].Customer
        WHERE LastName = @LastName
    )

    IF @NameExists = 1
    BEGIN
        RETURN 0
    END

    IF @NameExists IS NULL
    BEGIN
        RETURN 1
    END

    RETURN 0

END