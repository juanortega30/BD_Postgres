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

-- LEFT JOIN 

SELECT 
    p.nombre AS nombre_paciente, 
    p.num_documento,
    c.fecha_hora, 
    c.estado
FROM Pacientes p
LEFT JOIN Citas c ON p.id_paciente = c.id_paciente;

-- RIGHT JOIN

SELECT 
    c.fecha_hora, 
    c.motivo, 
    m.nombre AS nombre_medico, 
    m.especialidad
FROM Citas c
RIGHT JOIN Medicos m ON c.id_medico = m.id_medico;

-- GROUP BY

SELECT 
    estado, 
    COUNT(id_cita) AS total_de_citas
FROM Citas
GROUP BY estado;


-- LIMIT 

SELECT 
    id_paciente, 
    nombre, 
    num_documento 
FROM Pacientes
ORDER BY id_paciente DESC
LIMIT 5;

-- OFSET

SELECT 
    id_paciente, 
    nombre, 
    num_documento 
FROM Pacientes
ORDER BY id_paciente DESC
LIMIT 5 OFFSET 5;