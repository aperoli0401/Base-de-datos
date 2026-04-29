-- Listado usuarios base de datos
select * from mysql.user;

CREATE USER alejandro@localhost;

CREATE USER alejandro2@localhost identified BY '12345';

CREATE USER pedro@localhost identified by '1234567';

CREATE USER pedro@localhost identified by password '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5';

DROP USER alejandro2@localhost;