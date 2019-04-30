---modo generico

set serveroutput on
declare
v_numero number;
v_factorial number;
begin
    v_factorial := factorial(&v_numero);
    dbms_output.put_line(v_factorial);
end;


-------con parámetro de entrada

CREATE OR REPLACE FUNCTION FACTORIAL 
(
  N IN NUMBER 
 RETURN NUMBER AS )
resultado number :=1;
BEGIN
for i 1..n loop
    resultado := resultado * 1;
end loop
--aquí devolvemos lo que vamos a calcular(return)
  RETURN resultado;
END FACTORIAL;