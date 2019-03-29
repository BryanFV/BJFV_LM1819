--1.-Estaciones---Tiene(1,N)<------>Sensores----Recoge(N:M)---->Variables de meteorologí<---Mide(N:M)---->Sensores
--2.- Variable M:
---Codigo, Nombre, unidad de medida.
--3.-Mide:
--Fecha, valor.
--4.-Estaciones 
--Código, Marca, nombre, ip, variacion
CREATE TABLE ESTACIONES(
CODIGO NUMBER,
MARCA VARCHAR2(50) NOT NULL,
FECHA DATE,
NACIONALIDAD VARCHAR2(20),
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
);
COMMIT;

CREATE TABLE SENSORES(
CODIGO NUMBER,
NOMBRE VARCHAR2(50) NOT NULL,
RAZA VARCHAR2(20) NOT NULL,
GRADO VARCHAR2(20) NOT NULL,
CODIGO_ACTOR NUMBER,
CODIGO_SUPERIOR NUMBER,
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
CONSTRAINT FK_ACTORES FOREIGN KEY (CODIGO_ACTOR) REFERENCES ACTORES(CODIGO) ON DELETE CASCADE,
CONSTRAINT FK_PERSONAJES FOREIGN KEY(CODIGO_SUPERIOR) REFERENCES PERSONAJES(CODIGO) ON DELETE CASCADE,
);
COMMIT;

CREATE TABLE PLANETAS(
CODIGO NUMBER,
GALAXIA VARCHAR2(50) NOT NULL,
NOMBRE VARCHAR2(50) NOT NULL,
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
);
COMMIT;

CREATE TABLE CAPITULOS(
TEMPORADA NUMBER,
ORDEN NUMBER,
TITULO VARCHAR2(50) NOT NULL,
FECHA DATE NOT NULL,
CONSTRAINT PK_TEMPORADA PRIMARY KEY (TEMPORADA),
CONSTRAINT PK_ORDEN PRIMARY KEY (ORDEN),
);

COMMIT;

CREATE TABLE PELICULAS(
CODIGO NUMBER,
TITULO VARCHAR2(50) NOT NULL,
DIRECTOR VARCHAR2(30) NOT NULL,
YEAR DATE,
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
);

COMMIT;

CREATE TABLE PERSONAJES_CAPITULOS(
CODIGO_PERSONAJE NUMBER,
TEMPORADA NUMBER,
ORDEN NUMBER,
CONSTRAINT PK1_COD_PERSONAJE PRIMARY KEY (CODIGO_PERSONAJE),
CONSTRAINT FK1_COD_PERSONAJE FOREIGN KEY (CODIGO_PERSONAJE)  REFERENCES PERSONAJES(CODIGO) ON DELETE CASCADE,
CONSTRAINT PK2_TEMPORADA PRIMARY KEY (TEMPORADA),
CONSTRAINT FK2_TEMPORADA FOREIGN KEY (TEMPORADA) REFERENCES CAPITULOS(TEMPORADA, ORDEN) ON DELETE CASCADE,
CONSTRAINT PK3_ORDEN PRIMARY KEY (TEMPORADA),
CONSTRAINT FK3_ORDEN FOREIGN KEY (ORDEN) REFERENCES CAPITULOS(TEMPORADA, ORDEN) ON DELETE CASCADE,
);

COMMIT;

CREATE TABLE PERSONAJES_PELICULAS(
CODIGO_PERSONAJE NUMBER,
CODIGO_PELICULA NUMBER,
CONSTRAINT PK1_COD_PERSONAJE PRIMARY KEY (CODIGO_PERSONAJE),
CONSTRAINT FK1_COD_PERSONAJE FOREIGN KEY(CODIGO_PERSONAJE) REFERENCES PERSONAJES(CODIGO) ON DELETE CASCADE,
CONSTRAINT PK2_COD_PELICULA PRIMARY KEY (CODIGO_PELICULA),
CONSTRAINT FK2_COD_PELICULA FOREIGN KEY (CODIGO_PELICULA) REFERENCES PELICULAS(CODIGO) ON DELETE CASCADE,
);

COMMIT;

CREATE TABLE NAVES(
CODIGO NUMBER,
NTRIPULANTES NUMBER NOT NULL,
NOMBRE VARCHAR2(50) NOT NULL,
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
);

COMMIT;

CREATE TABLE VISITAS(
CODIGO_NAVE NUMBER,
CODIGO_PLANETA NUMBER,
TEMPORADA NUMBER,
ORDEN NUMBER,
CONSTRAINT PK1_COD_NAVE PRIMARY KEY (CODIGO_NAVE),
CONSTRAINT FK1_COD_NAVE FOREIGN KEY (CODIGONAVE) REFERENCES NAVES(CODIGO) ON DELETE CASCADE,
CONSTRAINT PK2_COD_PLANETA PRIMARY KEY (CODIGO_PLANETA),
CONSTRAINT FK2_COD_PLANETA FOREIGN KEY(CODIGO_PLANETA) REFERENCES PLANETAS(CODIGO) ON DELETE CASCADE,
CONSTRAINT PK3_TEMPORADA PRIMARY KEY (TEMPORADA),
CONSTRAINT FK3_TEMPORADA FOREIGN KEY (TEMPORADA) REFERENCES CAPITULOS(TEMPORADA, ORDEN) ON DELETE CASCADE,
CONSTRAINT PK4_ORDEN PRIMARY KEY (ORDEN),
CONSTRAINT FK4_ORDEN FOREIGN KEY (ORDEN) REFERENCES CAPITULOS(TEMPORADA, ORDEN) ON DELETE CASCADE,
);

COMMIT;

