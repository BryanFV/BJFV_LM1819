--Que el campo NTripulantes de la tabla Naves solo pueda tener un valor entre 1 y 500--
ALTER TABLE NAVES 
ADD CONSTRAINT CH_NTRIPULANTES
CHECK (NTRIPULANTES BETWEEN 1 AND 500);

--Que el campo Galaxia de la tabla Planetas solo pueda tener los valores ('ViaLáctea', 'Andrómeda', 'Sombrero').--

ALTER TABLE PLANETAS
ADD CONSTRAINT CK_GALAXIA
CHECK (GALAXIA IN ('VIA LACTEA', 'ANDROMEDA', 'SOMBRERO'));
