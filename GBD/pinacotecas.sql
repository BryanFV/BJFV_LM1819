 --En un archivo llamado consultas_pinacotecas.sql realizar las siguientes consultas:
--1.Consultar el contenido de todas las tablas.
ELECT * FROM  cuadros, cuadros_pintores, escuelas, maestros, mecenas, mecenazgo, pinacotecas, pintores, pintores_escuelas; 
--2.Consultar sólo el identificador y el nombre las siguientes tablas:Pinacotecas.Cuadros.Pintores.Mecenas.Escuelas.
select ID_PINACOTECA from pinacotecas;
select id_cuadro from cuadros;
select id_pintor from pintores;
select id_mecenas from mecenas;
select id_escuela from escuelas;
--3.Usando concatenación de textos, se pide listar los datos de la tabla pintores con las siguientes columnas: "IDENTIFICADOR", "NOMBRE", "ID-NOMBRE", donde ID-NOMBRE será el resultado de la concatenación del campo ID_PINTOR y de N_PINTOR.
SELECT PINTORES.id_pintor, PINTORES.N_PINTOR AS "ID-PINTOR" FROM PINTORES;
SELECT concat(id_pintor, N_PINTOR) AS "ID-PINTOR" FROM PINTORES;
--4.Usando concatenación de textos, listar el contenido de la tabla pinacotecas de la siguiente forma: 
--"Pinacoteca (ID_PINACOTECA): (NOMBRE)".
 SELECT concat('Pinacoteca ', id_pinacoteca, ': ', pinacoteca) AS "NOMBRE" FROM pinacotecas;
--5.Seleccionar nombre y país de la tabla pinacotecas donde ID_PINACOTECA es "MUBAS".
select nombre, pais from pinacotecas where id_pinacoteca='MUBAS';
--6.Seleccionar técnica, ancho y alto de los siguientes cuadros: La Gioconda, El nacimiento de Venus y Sagrada Familia.
SELECT TECNICA, ANCHO, ALTO FROM CUADROS WHERE N_CUADRO='LA GIOCONDA' or n_cuadro='EL NACIMIENTO DE VENUS' or n_cuadro='SAGRADA FAMILIA';
--7.Seleccionar nombre y ciudad de nacimiento de los mecenas italianos.
select n_mecenas, ciudad_nac from Mecenas where pais ='ITALIA';
--8.Seleccionar el nombre de los mecenas que nacieron en Madrid o en Valladolid.
select n_mecenas from mecenas where ciudad_nac ='MADRID' or ciudad_nac='VALLADOLID';
--9.Seleccionar nombre y fecha de aparición de las escuelas españolas o italianas.
SELECT N_ESCUELA, FECHA_APARICION FROM ESCUELAS WHERE PAIS ='ESPAÑA' OR PAIS='ITALIA';
--10.Idem anterior pero usando la cláusula IN.
SELECT N_ESCUELA, FECHA_APARICION FROM ESCUELAS WHERE PAIS IN('ESPAÑA','ITALIA');
--11.Seleccionar nombre y ciudad de nacimiento de los mecenas holandeses y belgas usando la cláusula IN.
SELECT n_mecenas, ciudad_nac FROM MECENAS WHERE PAIS IN ('HOLANDA', 'BELGICA');
--12.Seleccionar nombre y ciudad de nacimiento de los mecenas cuyo nombre comienza por F y termina en O.
SELECT n_mecenas, ciudad_nac FROM MECENAS WHERE n_mecenas LIKE 'F%' AND n_mecenas LIKE '%O';