
-- =============================================
-- mTVF
-- =============================================
-- Firma chce automatycznie sprawdzić status uczestników na podstawie 
-- ich potwierdzenia uczestnictwa i opłacenia szkolenia

CREATE FUNCTION Student_1.ufn_ParticipantStatus
(
@Status NVARCHAR(20),
@PaymentStatus NVARCHAR(20)
)
RETURNS @Result TABLE
(
ParticipantStatus NVARCHAR(50)
)
AS
BEGIN

IF @Status = 'confirmed'
AND @PaymentStatus = 'paid'
BEGIN
INSERT INTO @Result
VALUES ('confirmed and paid')
END

ELSE IF @Status = 'confirmed'
AND @PaymentStatus = 'unpaid'
BEGIN
INSERT INTO @Result
VALUES ('payment needed')
END

ELSE IF @Status = 'unconfirmed'
AND @PaymentStatus = 'paid'
BEGIN
INSERT INTO @Result
VALUES ('paid but unconfirmed')
END

ELSE
BEGIN
INSERT INTO @Result
VALUES ('unconfirmed and unpaid')
END

RETURN
END