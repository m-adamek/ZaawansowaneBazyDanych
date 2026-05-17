

CREATE   PROCEDURE SalesLT.AddNewProduct
(
    @ProductName NVARCHAR(50),
    @ProductCategory NVARCHAR(50),
    @ListPrice MONEY,
    @Amount INT,
    @ProductNumber NVARCHAR(65)
)
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY

        BEGIN TRAN;

        DECLARE @CategoryID INT

        SELECT @CategoryID = ProductCategoryID
        FROM SalesLT.ProductCategory
        WHERE [Name] = @ProductCategory


        INSERT INTO SalesLT.Product
        (
            [Name],
            [ProductNumber],
            [ProductCategoryID],
            [StandardCost],
            [ListPrice],
            [SellStartDate],
            [rowguid],
            [ModifiedDate]
        )
        VALUES
        (
            @ProductName,
            @ProductNumber,
            @CategoryID,
            @ListPrice,
            @ListPrice,
            GETDATE(),
            NEWID(),
            GETDATE()
        )


        DECLARE @ProductID INT

        SET @ProductID = SCOPE_IDENTITY()


        INSERT INTO SalesLT.ProductInventory
        (
            ProductID,
            ProductAmount
        )
        VALUES
        (
            @ProductID,
            @Amount
        )

        COMMIT TRAN;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;

        SELECT ERROR_MESSAGE() AS ErrorMessage;

    END CATCH;

END