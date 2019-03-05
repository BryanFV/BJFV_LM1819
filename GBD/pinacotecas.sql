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
--4.Usando concatenación de textos, listar el contenido de la tabla pinacotecas de la siguiente forma: "Pinacoteca (ID_PINACOTECA): (NOMBRE)".
 ASDAS
--5.Seleccionar nombre y país de la tabla pinacotecas donde ID_PINACOTECA es "MUBAS".
--6.Seleccionar técnica, ancho y alto de los siguientes cuadros: La Gioconda, El nacimiento de Venus y Sagrada Familia.
--7.Seleccionar nombre y ciudad de nacimiento de los mecenas italianos.
--8.Seleccionar el nombre de los mecenas que nacieron en Madrid o en Valladolid.
--9.Seleccionar nombre y fecha de aparición de las escuelas españolas o italianas.
--10.Idem anterior pero usando la cláusula IN.
--11.Seleccionar nombre y ciudad de nacimiento de los mecenas holandeses y belgas usando la cláusula IN.
--12.Seleccionar nombre y ciudad de nacimiento de los mecenas cuyo nombre comienza por F y termina en O.