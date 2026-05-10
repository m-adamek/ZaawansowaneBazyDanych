
CREATE FUNCTION dbo.fn_GetCustomerCreditRisk
(
@CustomerID INT
)
RETURNS VARCHAR(10)
AS
BEGIN

DECLARE @Orders TABLE
(
TotalDue MONEY,
DueDate DATETIME,
ShipDate DATETIME
)

INSERT INTO @Orders
SELECT
TotalDue,
DueDate,
ShipDate
FROM SalesLT.SalesOrderHeader
WHERE CustomerID = @CustomerID

DECLARE @Total MONEY
DECLARE @LateOrders INT

SELECT
@Total = SUM(TotalDue)
FROM @Orders

SELECT
@LateOrders = COUNT(*)
FROM @Orders
WHERE DATEDIFF(DAY, DueDate, ShipDate) > 3

IF @Total > 100000
AND @LateOrders >= 2
BEGIN
RETURN 'HIGH'
END

IF @Total > 50000
BEGIN
RETURN 'MEDIUM'
END

RETURN 'LOW'

END