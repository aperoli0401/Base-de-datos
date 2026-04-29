-- Funciones MySQL

-- Funciones de lista
-- 1. Devuelve el valor mayor de la lista
SELECT greatest(45, 67, 12, 5) valor_max;

-- 2. Ángulo, radianes y seno
SELECT 
	'Ángulo de:',
    45,
    RADIANS(45) radianes,
    SIN(RADIANS(45)) seno;
    
-- 3. Nos da cuatro numeros aleatorios entre 0 y 1
SELECT RAND() val_1, RAND() val_2, RAND() val_3, RAND() val_4;

-- 4. Numero aleatorio entre 1 y 10
SELECT ceiling(RAND() * 10);

-- 5. Numero aleatorio entre 0 y 9
SELECT floor(RAND() * 10);

-- 6. Numero aleatorio entre 1 y 6
SELECT 	ceiling(RAND()*6) dado_1,
		ceiling(RAND()*6) dado_2,
        ceiling(RAND()*6) dado_3,
        ceiling(RAND()*6) dado_4;
        
-- 7. 
SELECT floor(RAND()*37);