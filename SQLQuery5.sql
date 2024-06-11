
--Listar Pacientes --

WITH UltimaVisitaCTE AS (

SELECT 
	p.PacienteID,
	p.Nombre,
	p.Apellido,
	v.FechaVisita,
	ROW_NUMBER() OVER (PARTITION BY p.PacientesID ORDER BY v.FechaVisita DESC) AS rn

	FROM
		Paciente P
	
	LEFT JOIN 
		HistoriaClinica hc on p.PacienteID = hc.PacienteID

	LEFT JOIN
		Visita v ON hc.HistoriaClinicaID = v.HistoriaClinicaID
)

SELECT 
	PacienteID,
	Nombre,
	Apellido,
	FechaVisita AS UltimaFechaVisita

FROM

	UltimaVisitaCTE

WHERE rn = 1

ORDER BY

FechaVisita DESC

