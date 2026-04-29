-- EJEMPLO TRANSACCIONES

-- iniciar transacción no confirmada
START TRANSACTION;
INSERT INTO transacciones(valor) VALUES (56), (45), (200);
UPDATE transacciones SET valor = 45 WHERE id = 1;
DELETE FROM transacciones WHERE id = 2;
-- transacción no confirmada
-- finaliza la transacción
ROLLBACK;

-- Iniciar transacción confirmada
START TRANSACTION;
INSERT INTO transacciones(valor) VALUES (56), (45), (200);
UPDATE transacciones SET valor = 45 WHERE id = 1;
DELETE FROM transacciones WHERE id = 2;
-- transacción confirmada
-- finaliza la transacción
COMMIT;

ROLLBACK;