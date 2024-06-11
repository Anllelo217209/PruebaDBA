CREATE DATABASE BD_Hospital;

CREATE TABLE Paciente (
PacienteID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
FechaNacimiento DATE,
Genero CHAR(1),
Direccion VARCHAR(200),
Telefono VARCHAR(50),
CorreoElectronico VARCHAR(100)
);


CREATE TABLE Medico(
MedicoID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
Especialidad VARCHAR(50),
NumeroLicencia VARCHAR(50),
Telefono VARCHAR(50),
CorreoElectronico VARCHAR(100)
);

CREATE TABLE HistoriaClinica(
HistoriaClinicaID INT PRIMARY KEY,
PacienteID INT NOT NULL,
FechaApertura DATE NOT NULL,
DiagnosticoInicial TEXT,
FOREIGN KEY (PacienteID) REFERENCES Paciente(PacienteID)
);

CREATE TABLE Visita(
VisitaID INT PRIMARY KEY,
HistoriaClinicaID INT NOT NULL,
MedicoID INT NOT NULL,
FechaVisita DATE NOT NULL,
MotivoVisita TEXT,
Diagnostico TEXT,
Tratamiento TEXT,
FOREIGN KEY (HistoriaClinicaID) REFERENCES HistoriaClinica(HistoriaClinicaID),
FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);

ALTER TABLE HistoriaClinica
ADD fechaUltimaVisita DATE;