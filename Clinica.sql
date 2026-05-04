CREATE TABLE Medicos (
    id_medico     SERIAL        PRIMARY KEY,
    nombre        VARCHAR(100)  NOT NULL,
    especialidad  VARCHAR(100)  NOT NULL,
    licencia      VARCHAR(50)   NOT NULL UNIQUE
);
 
CREATE TABLE Pacientes (
    id_paciente        SERIAL       PRIMARY KEY,
    nombre             VARCHAR(100) NOT NULL,
    fecha_nacimiento   DATE         NOT NULL,
    telefono           VARCHAR(20),
    num_documento      VARCHAR(30)  NOT NULL UNIQUE
);
 
CREATE TABLE Citas (
    id_cita          SERIAL      PRIMARY KEY,
    id_medico        INT         NOT NULL REFERENCES Medicos(id_medico),
    id_paciente      INT         NOT NULL REFERENCES Pacientes(id_paciente),
    fecha_hora       TIMESTAMP   NOT NULL,
    motivo           TEXT,
    estado           VARCHAR(20) NOT NULL DEFAULT 'pendiente'
                     CHECK (estado IN ('pendiente', 'completada', 'cancelada'))
);