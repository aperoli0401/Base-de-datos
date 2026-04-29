USE empleados_taller;

ALTER TABLE Clientes
ADD apellidos VARCHAR(45),
ADD poblacion VARCHAR(50),
ADD nacionalidad VARCHAR(30) DEFAULT 'España',
ADD email VARCHAR(100),
ADD direccion VARCHAR(100),
ADD cod_cliente VARCHAR(10),
ADD tipo_cliente INT,
ADD UNIQUE (cod_cliente);

ALTER TABLE Clientes
MODIFY nombre VARCHAR(25) NOT NULL,
MODIFY apellidos VARCHAR(45) NOT NULL,
MODIFY direccion VARCHAR(100),
MODIFY nacionalidad VARCHAR(30) DEFAULT 'España';

ALTER TABLE Clientes
CHANGE email correo_electronico VARCHAR(100);

CREATE INDEX idx_clientes_apellidos_nombre
ON Clientes (apellidos, nombre);

SHOW INDEX FROM Clientes;
