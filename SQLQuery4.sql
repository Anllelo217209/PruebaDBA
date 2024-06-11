-- creacion de trigger --

CREATE TRIGGER ActualizarFechaUltimaVisita

ON Visita

AFTER INSERT

AS

BEGIN

	SET NOCOUNT ON;

	DECLARE @HistoriaClinicaID INT;
	DECLARE @FechaVisita DATE;

-- Obtengo los valores insertados --

SELECT @HistoriaClinicaID = HistoriaClinicaID, @FechaVisita = FechaVisita
FROM inserted;

--- actualizo --

UPDATE HistoriaClinica
SET @FechaVisita = @FechaVisita
WHERE HistoriaClinicaID = @HistoriaClinicaID;

END;


