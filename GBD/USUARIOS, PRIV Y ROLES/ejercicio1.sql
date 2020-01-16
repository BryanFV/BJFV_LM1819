--1-
CREATE USER ADMINISTRADOR IDENTIFIED BY ADMIN 
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP 
QUOTA 500K ON USERS; 
--4--
select * from dba_role_privs where grantee='ADMINISTRADOR'; 
select * from dba_tab_privs where grantee='ADMINISTRADOR'; 
select * from dba_sys_privs where grantee='ADMINISTRADOR'; 

--6--
CREATE USER USUARIO_0 IDENTIFIED BY USUARIO0
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP 
QUOTA 0K ON USERS; 

--10---
create tablespace academo datafile 'academo01.dbf' size 1M
2 autoextend on next 200k maxsize 1400K
3 default storage (initial 16k next 16k
4 minextents 1 maxextents 3);
--
create tablespace nomina datafile 'nomina01.dbf' size 1M
2 autoextend on next 100K maxsize 1500K
3 default storage (initial 16k next 16k
4 minextents 1 maxextents 3);