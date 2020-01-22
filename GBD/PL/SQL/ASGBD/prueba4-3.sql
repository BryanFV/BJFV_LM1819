create or replace function VERIFICAR_PASSWORD  (username VARCHAR2, password VARCHAR2, old_password VARCHAR2)
 RETURN BOOLEAN
is
--EJERCICIO 4.3 BRAYAN FERNANDEZ VALENCIA
BEGIN
--NO PUEDE SER MENOR QUE SIETE

    IF LENGTH (password)<= 7 THEN
    raise_application_error(-20001, 'La contraseña debe tener al menos 12 carácteres.');
    END IF;

--MIRAMOS SI LA CONTRASEÑA ES IGUAL AL NOMBRE DE USUARIO
    IF (password=username) THEN
    raise_application_error(-20002, 'El Password no puede ser igual al usuario');
    END IF;

--COMPROBAMOS QUE NO ES IGUAL A MI NOMBRE

    IF (password='bryannn') THEN
    raise_application_error(-20003, 'El Password no puede ser igual a tu nombre');
    END IF;
END;
--CREACION DE PERFIL Y CONFIGURACION CORRECTA
CREATE PROFILE EJER43GBD LIMIT
PASSWORD_VERIFY_FUNCTION VERIFICAR_PASSWORD;
alter user usuario_0 profile EJER43GBD;
--BRYAN FERNANDEZ VALENCIA