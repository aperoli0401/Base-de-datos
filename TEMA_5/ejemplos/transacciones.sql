-- Transacciones 
USE test;

-- Tabla transacciones
DROP TABLE IF EXISTS transacciones;
CREATE TABLE IF NOT EXISTS transacciones(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valor INT 
);

-- Insertamos valores en la tabla
INSERT INTO transacciones(valor) VALUES
(5), (7), (8), (20), (31);
