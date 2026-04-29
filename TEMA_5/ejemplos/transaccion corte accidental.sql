-- Iniciar transacción con corte accidental
START TRANSACTION;
INSERT INTO transacciones(valor) VALUES (123), (47), (250);
UPDATE transacciones SET valor = 300 WHERE id = 1;
DELETE FROM transacciones WHERE id = 5;