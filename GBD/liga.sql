---JUGADORES---

--1.- 
INSERT INTO JUGADORES (codigo, nombre, fechanacimiento, posicion, codigoequipo) VALUES (1, 'Iker Casillas', to_date('5-6-80', 'DD-MM-YYYY'), 'Portero', 1);
--2.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (2, 'Ronaldo', to_date('7-7-84', 'DD-MM-YYYY'), 'Delantero', 1);
--3.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (3, 'Zidedine Zidane', to_date('6-6-68', 'DD-MM-YYYY'), 'Centrocampista', 1);
--4.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (4, 'Samuel Etoo', to_date('3-3-76','DD-MM-YYYY'), 'Delantero', 2);
--5.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (5, 'Ronaldinho', to_date('5-5-79','DD-MM-YYYY'), 'Centrocampista', 2);
--6.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (6, 'Deco', to_date('3-3-76','DD-MM-YYYY'), 'Centrocampista', 2);
--7.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (7, 'Baraja', to_date('5-5-75','DD-MM-YYYY'), 'Centrocampista', 3);
--8.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (8, 'Albeda', to_date('3-3-73','DD-MM-YYYY'), 'Centrocampista', 3);
--9.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (9, 'Aimar', to_date('5-5-75','DD-MM-YYYY'), 'Centrocampista', 3);
--10.-
INSERT INTO JUGADORES (CODIGO, NOMBRE, FECHANACIMIENTO, POSICION, CODIGOEQUIPO) VALUES (10, 'Vicente', to_date('6-5-76','DD-MM-YYYY'), 'Centrocampista', 3);

--EQUIPOS--

--1.-
INSERT INTO EQUIPOS (CODIGO, NOMBRE, ESTADIO, AFORO, ANNODEFUNDACION, CODIGOEQUIPO) VALUES (1, 'Real Madrid', 'Santiago Bernabeu', 80000, to_date('01-01-1950', 'DD-MM-YY') 'Madrid');
--2.-
INSERT INTO EQUIPOS (CODIGO, NOMBRE, ESTADIO, AFORO, ANNODEFUNDACION, CODIGOEQUIPO) VALUES (2, 'F.C. Barcelona', 'Camp Nou', 70000, 1948, 'Barcelona');
--3.-
INSERT INTO EQUIPOS (CODIGO, NOMBRE, ESTADIO, AFORO, ANNODEFUNDACION, CODIGOEQUIPO) VALUES (3, 'Valencia C.F', 'Mestalla', 60000, 1952, 'Valencia');
--4.-
INSERT INTO EQUIPOS (CODIGO, NOMBRE, ESTADIO, AFORO, ANNODEFUNDACION, CODIGOEQUIPO) VALUES (4, 'Atlético de Madrid', 'Vicente Calderón', 55000, 1945, 'Madrid');

--PARTIDOS--

--1.-
INSERT INTO PARTIDOS (CODIGO, FECHA, CODIGOEQUIPOVISITANTE, CODIGOEQUIPOLOCAL) VALUES (1, to_date('3-3-05','DD-MM-YYYY'), 2, 1);
--2.-
INSERT INTO PARTIDOS (CODIGO, FECHA, CODIGOEQUIPOVISITANTE, CODIGOEQUIPOLOCAL) VALUES (2, to_date('4-4-05','DD-MM-YYYY'), 3, 1);
--3.-
INSERT INTO PARTIDOS (CODIGO, FECHA, CODIGOEQUIPOVISITANTE, CODIGOEQUIPOLOCAL) VALUES (3, to_date('3-4-05','DD-MM-YYYY'), 2, 4);

--GOLES--

--1.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 2, 35, 'De falta');
--2.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 2, 70, NULL);
--3.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 4, 88, NULL);
--4.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 3, 5, NULL);
--5.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 2, 10, 'De Penalti');
--6.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 3, 47, NULL);
--7.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (1, 7, 60, NULL);
--8.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (2, 9, 8, NULL);
--9.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (2, 9, 9, NULL);
--10.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (2, 7, 50, 'De Penalti');
--11.-
INSERT INTO GOLES (CODIGOPARTIDO, CODIGOJUGADOR, MINUTO, DESCRIPCION) VALUES (2, 7, 65, NULL);




