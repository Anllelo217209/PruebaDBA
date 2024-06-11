

--Creación de PA --

CREATE PROCEDURE RegitrarNuevaVisita
@PacienteID INT,
@MedicoID INT,
@FechaVisitaID DATE,
@Diagnostico TEXT,
@Tratamiento TEXT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @HistoriaClinicaID INT;

-- Aquí obtengo la ID del paciente --

	SELECT TOP 1 @HistoriaClinicaID = HistoriaClinicaID
	FROM HistoriaClinica
	WHERE PacienteID = @PacienteID;

-- Aquí verifico si está la HC --
	
	IF @HistoriaClinicaID IS NULL
	BEGIN
	RAISERROR ('No se encuentra la HC', 16, 1);
	
	END 
	
	ELSE
	
	BEGIN

-- Aqui inserto la nueva visita en la tabla Visita --

		INSERT INTO Visita(HistoriaClinicaID, MedicoID, FechaVisita, MotivoVisita, Diagnostico, Tratamiento)
		VALUES (@HistoriaClinicaID, @MedicoID, @FechaVisitaID, '' , @Diagnostico, @Tratamiento);

	END

END;

