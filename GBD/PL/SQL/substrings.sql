--contar y elegir el lugar de partida
SET SERVEROUTPUT ON
declare
v_cad1 varchar2(50):= 'Jaime Caraver';
v_cad2 varchar2(50);
begin
  v_cad2:= substr(v_cad1, 7);
  dbms_output.put_line('v_cad2');
end;

concat(v_resultado, substr(cadena, i, 1));

