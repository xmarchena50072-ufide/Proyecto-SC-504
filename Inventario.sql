--Ejecutar dentro de sqlplus / as sysdba
ALTER session set "_ORACLE_SCRIPT"=true;
CREATE USER inventario IDENTIFIED BY DBFide1;

GRANT create session TO inventario;
GRANT create table TO inventario;
GRANT create view TO inventario;
GRANT create any trigger TO inventario;
GRANT create any procedure TO inventario;
GRANT create sequence TO inventario;
GRANT create synonym TO inventario;

--Permisos para INSERT https://stackoverflow.com/a/21671145
ALTER USER inventario quota unlimited on USERS;

------------------------------------------------------------
-- Ejecutar en SQLDEVELOPER
-- Tabla "CATEGORĶAS"
CREATE TABLE CATEGORIAS (
ID_CATEGORIA INT PRIMARY KEY,
NOMBRE_CATEGORIA VARCHAR(100)
);

-- Tabla "EQUIPOS"
CREATE TABLE EQUIPOS (
ID_EQUIPO INT PRIMARY KEY,
NOMBRE_EQUIPO VARCHAR(100),
DESCRIPCION VARCHAR(200),
NUM_SERIE VARCHAR(50),
CANTIDAD_DISPONIBLE INT,
CATEGORIA INT,
FOREIGN KEY (CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
);

-- Tabla "DEPARTAMENTOS"
CREATE TABLE DEPARTAMENTOS (
ID_DEPARTAMENTO INT PRIMARY KEY,
NOMBRE_DEPARTAMENTO VARCHAR(100)
);

-- Tabla "PERSONAL"
CREATE TABLE PERSONAL (
ID_PERSONAL INT PRIMARY KEY,
NOMBRE VARCHAR(100),
TELEFONO VARCHAR(20),
CORREO VARCHAR(100),
ID_DEPARTAMENTO INT,
FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS(ID_DEPARTAMENTO)
);

CREATE SEQUENCE personal_seq START WITH 1;

-- Tabla "ROLES"
CREATE TABLE ROLES (
ID_ROL INT PRIMARY KEY,
NOMBRE VARCHAR(100),
DESCRIPCION VARCHAR(200)
);

-- Tabla "PERMISOS"
CREATE TABLE PERMISOS (
ID_PERMISOS INT PRIMARY KEY,
NOMBRE VARCHAR(100),
ID_ROL INT,
DESCRIPCION VARCHAR(200),
FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID_ROL)
);

-- Tabla "PROVEEDORES"
CREATE TABLE PROVEEDORES (
ID_PROVEEDOR INT PRIMARY KEY,
NOMBRE VARCHAR(100),
TELEFONO VARCHAR(20),
CORREO VARCHAR(100)
);

-- Tabla "RECEPCIONES"
CREATE TABLE RECEPCIONES (
ID_RECEPCION INT PRIMARY KEY,
ID_EQUIPO INT,
ID_ALMACEN INT,
FECHA DATE,
HORA TIMESTAMP,
FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID_EQUIPO),
FOREIGN KEY (ID_ALMACEN) REFERENCES ALMACENES(ID_ALMACEN)
);

-- Tabla "ALMACENES"
CREATE TABLE ALMACENES (
ID_ALMACEN INT PRIMARY KEY,
ID_RECEPCION INT,
ID_EQUIPO INT,
NOMBRE_ALMACEN VARCHAR(100),
FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID_EQUIPO)
);

-- Tabla "DESPACHOS"
CREATE TABLE DESPACHOS (
ID_DESPACHO INT PRIMARY KEY,
ID_EQUIPO INT,
ID_DEPARTAMENTO INT,
FECHA DATE,
HORA TIMESTAMP,
ID_PERSONAL INT,
FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID_EQUIPO),
FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS(ID_DEPARTAMENTO),
FOREIGN KEY (ID_PERSONAL) REFERENCES PERSONAL(ID_PERSONAL)
);

-- Tabla "USUARIOS"
CREATE TABLE USUARIOS (
ID_USUARIOS INT PRIMARY KEY,
ID_PERSONAL INT,
USERNAME VARCHAR(100),
PASSWORD VARCHAR(100),
ID_ROL INT,
FOREIGN KEY (ID_PERSONAL) REFERENCES PERSONAL(ID_PERSONAL),
FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID_ROL)
);

-- Tabla "COMPRA"
CREATE TABLE COMPRA (
ID_COMPRA INT PRIMARY KEY,
ID_PROVEEDOR INT,
FECHA_COMPRA DATE,
ID_DETALLE_COMPRA INT,
FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR),
FOREIGN KEY (ID_DETALLE_COMPRA) REFERENCES DETALLE_COMPRA(ID_DETALLE_COMPRA)
);

-- Tabla "DETALLE_COMPRA"
CREATE TABLE DETALLE_COMPRA (
ID_DETALLE_COMPRA INT PRIMARY KEY,
MATERIAL VARCHAR(100),
CANTIDAD INT,
PRECIO_UNITARIO DECIMAL(10,2)
);

--SECCION DE INSERTS
--CATEGORIAS
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (1, 'Categorķa 1');

INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (2, 'Categorķa 2');


CREATE VIEW VIEW_DETALLE_COMPRA AS
SELECT ID_DETALLE_COMPRA, MATERIAL, CANTIDAD, PRECIO_UNITARIO, CANTIDAD * PRECIO_UNITARIO AS TOTAL
FROM DETALLE_COMPRA;


CREATE OR REPLACE PROCEDURE procedure_read_detalle_compra(
	   o_c_dbuser OUT SYS_REFCURSOR)
    AS
    BEGIN

      OPEN o_c_dbuser FOR
      SELECT * FROM view_detalle_compra;

    END;

CREATE OR REPLACE PROCEDURE procedure_create_personal(
    p_nombre IN PERSONAL.NOMBRE%TYPE,
    o_c_dbuser OUT SYS_REFCURSOR
)
AS
BEGIN
    INSERT INTO PERSONAL (ID_PERSONAL, NOMBRE, TELEFONO, CORREO, ID_DEPARTAMENTO)
    VALUES (3, p_nombre, '123456789', 'example@example.com', 2);

    OPEN o_c_dbuser FOR
    SELECT *
    FROM PERSONAL
    WHERE NOMBRE = p_nombre;
END;





ROLLBACK;