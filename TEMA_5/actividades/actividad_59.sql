-- actividad 5.9 

DROP TABLE IF EXISTS RestriccionesDefault;
CREATE TABLE IF NOT EXISTS RestriccionesDefault(
    id INT AUTO_INCREMENT PRIMARY KEY,
    poblacion VARCHAR(50) DEFAULT 'Ubrique',
    provincia VARCHAR(50) DEFAULT 'Cádiz',
    nacionalidad VARCHAR(50) DEFAULT 'España',
    precio DECIMAL(10,2) DEFAULT 10.20,
    sueldo DECIMAL(10,2) DEFAULT 1500.00,
    fecha_hora_llegada DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_llegada DATE DEFAULT (CURRENT_DATE),
    hora_llegada TIME DEFAULT (CURRENT_TIME),
    casado BOOLEAN DEFAULT 1,
    carnet_conducir BOOLEAN DEFAULT 1
);

INSERT INTO RestriccionesDefault () VALUES ();
INSERT INTO RestriccionesDefault (poblacion, sueldo, casado)
VALUES ('Ronda', 1800.00, 0);
INSERT INTO RestriccionesDefault (provincia, nacionalidad, precio, carnet_conducir)
VALUES ('Sevilla', 'Portugal', 15.50, 0);
