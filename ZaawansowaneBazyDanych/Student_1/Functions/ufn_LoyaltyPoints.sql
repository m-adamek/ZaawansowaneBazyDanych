-- =============================================
-- Funkcja skalarna
-- =============================================
-- Firma potrzebuje funkcji do obliczenia punktów lojalnościowych
-- na podstawie odbytych szkoleń, aby móc stwierdzić
-- czy osobie należy się zniżka na kolejne szkolenie

CREATE FUNCTION Student_1.ufn_LoyaltyPoints
(
@ParticipantID INT
)
RETURNS NVARCHAR(20)
AS
BEGIN

DECLARE @TrainingsNumber INT
DECLARE @Points INT
DECLARE @Discount NVARCHAR(20)

SELECT
@TrainingsNumber = COUNT(*)
FROM Student_1.TrainingParticipants
WHERE ParticipantID = @ParticipantID
AND Status = 'completed'

SET @Points = @TrainingsNumber * 10

IF @Points >= 100
BEGIN
SET @Discount = '10% discount'
END

ELSE IF @Points >= 50
BEGIN
SET @Discount = '5% discount'
END

ELSE
BEGIN
SET @Discount = 'No discount'
END

RETURN @Discount

END