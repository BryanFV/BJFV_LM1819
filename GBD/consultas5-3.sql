---1. Inserta en la tabla "Programas" el sistema operativo Windows 10 Professional.

insert into programas values(21, 'Windows 10', 'profesional');

--2. Crea una tabla llamada "Microsoft" con la misma estructura que la tabla "Programas". Inserta en ella sólo aquellos programas del fabricante "Microsoft".

create table Microsoft(
	codigo		number(2,0) constraint pk_programa primary key,
	nombre		varchar2(30),
	version		varchar2(20)
	)tablespace PROGRAMAS;

insert into Microsoft
select p.codigo, p.nombre, p.version
from programas 
p inner join desarrolla d on p.codigo = d.codigo inner join fabricante f on d.id_fab = f.id_fab where id_fab = '2';

--3. Inserta en la tabla "Registra" las filas correspondientes a los registros que haría el cliente con DNI "5" para cada uno de los programas que podría comprar en "El Corte Inglés" de Sevilla. Los registros los haría por Internet.
Select into registra
select c.dni, r.cif, co.cif, d.cif, d.codigo, p.codigo from clientes
where c inner join registra r on c.dni = r.dni 
inner join comercio co on r.cif = co.cif 
inner join distribuye d on co.cif = d.cif 
inner join programa p on d.codigo = p.codigo;


--4. Añade a la tabla "Programas" una columna llamada "registros" de tipo number. A continuación, para cada programa, escribe en esta columna el número de registros que se han realizado del mismo, independientemente del medio utilizado para ello (Internet, teléfono o Tarjeta postal).
alter table programas add registros number;
update programas p
set registros=(select count(codigo) from programas);

--5. Añade ahora a la tabla "Programas" tres columnas más: "resgistros_i", "registros_t" y "registros_p". Actualiza cada una con el número de registros que se han realizado por cada medio (Internet, Teléfono y Tarjeta postal).
alter table programas add registros_i number;
alter table programas add registros_t number;
alter table programas add registros_p number;
update programas p
set resgistros_i=(select count(p.codigo) 
                    from programas p 
                    inner join registra r on r.codigo=p.codigo
                    where r.medio='Internet');
update programas p
set registros_t=(select count(p.codigo) 
                    from programas p 
                    inner join registra r on r.codigo=p.codigo
                    where r.medio='Teléfono');
update programas p
set registros_p=(select count(p.codigo) 
                    from programas p 
                    inner join registra r on r.codigo=p.codigo
                    where r.medio='Tarjeta postal');

--6. Añade a la tabla "Clientes" una columna llamada "registrados" de tipo number que deberás actualizar con el número de registros que ha efectuado el cliente, independientemente del medio por el que lo haya hecho.
 alter table clientes add registrados number;
update clientes c
set registrados=(select count(dni) from clientes);


