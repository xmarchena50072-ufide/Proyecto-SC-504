CREATE OR REPLACE VIEW vista_categorias AS
SELECT
    ID_CATEGORIA AS "Identificador de categoría",
    NOMBRE_CATEGORIA AS "Nombre de la categoría"
FROM CATEGORIAS;
/

CREATE OR REPLACE VIEW vista_roles AS
SELECT
    ID_ROL AS "Identificador de rol",
    NOMBRE AS "Nombre de rol",
    DESCRIPCION AS "Descripción de rol"
FROM ROLES;
/

CREATE OR REPLACE VIEW vista_permisos AS
SELECT
    ID_PERMISOS AS "Identificador de permisos",
    NOMBRE AS "Nombre de permiso",
    ID_ROL AS "Identificador de rol",
    DESCRIPCION AS "Descripción de permiso"
FROM PERMISOS;
/

CREATE OR REPLACE VIEW vista_proveedores AS
SELECT
    ID_PROVEEDOR AS "Identificador de proveedor",
    NOMBRE AS "Nombre de proveedor",
    TELEFONO AS "Teléfono de proveedor",
    CORREO AS "Correo de proveedor"
FROM PROVEEDORES;
/

CREATE OR REPLACE VIEW vista_almacenes AS
SELECT
    ID_ALMACEN AS "Identificador de almacén",
    NOMBRE_ALMACEN AS "Nombre de almacén"
FROM ALMACENES;
/

CREATE OR REPLACE VIEW vista_equipos AS
SELECT
    ID_EQUIPO AS "Identificador de equipo",
    NOMBRE_EQUIPO AS "Nombre del equipo",
    CANTIDAD_DISPONIBLE AS "Cantidad disponible",
    ID_CATEGORIA AS "Identificador de categoría"
FROM EQUIPOS;
/

CREATE OR REPLACE VIEW vista_departamentos AS
SELECT
    ID_DEPARTAMENTO AS "Identificador de departamento",
    NOMBRE_DEPARTAMENTO AS "Nombre del departamento"
FROM DEPARTAMENTOS;
/

CREATE OR REPLACE VIEW vista_personal AS
SELECT
    ID_PERSONAL AS "Identificador de personal",
    NOMBRE AS "Nombre",
    TELEFONO AS "Teléfono",
    CORREO AS "Correo",
    ID_DEPARTAMENTO AS "Identificador de departamento"
FROM PERSONAL;
/

CREATE OR REPLACE VIEW vista_recepciones AS
SELECT
    ID_RECEPCION AS "Identificador de recepción",
    ID_EQUIPO AS "Identificador de equipo",
    ID_ALMACEN AS "Identificador de almacén",
    FECHA AS "Fecha de recepción",
    HORA AS "Hora de recepción"
FROM RECEPCIONES;
/

CREATE OR REPLACE VIEW vista_despachos AS
SELECT
    ID_DESPACHO AS "Identificador de despacho",
    ID_EQUIPO AS "Identificador de equipo",
    ID_DEPARTAMENTO AS "Identificador de departamento",
    FECHA AS "Fecha de despacho",
    HORA AS "Hora de despacho",
    ID_PERSONAL AS "Identificador de personal"
FROM DESPACHOS;
/

CREATE OR REPLACE VIEW vista_usuarios AS
SELECT
    ID_USUARIOS AS "Identificador de usuario",
    ID_PERSONAL AS "Identificador de personal",
    USERNAME AS "Nombre de usuario",
    PASSWORD AS "Contraseña",
    ID_ROL AS "Identificador de rol"
FROM USUARIOS;
/

CREATE OR REPLACE VIEW vista_compras AS
SELECT
    ID_COMPRA AS "Identificador de compra",
    ID_PROVEEDOR AS "Identificador de proveedor",
    FECHA_COMPRA AS "Fecha de compra"
FROM COMPRAS;
/

CREATE OR REPLACE VIEW vista_detalle_compras AS
SELECT
    ID_DETALLE_COMPRA AS "Identificador de detalle de compra",
    MATERIAL AS "Material",
    CANTIDAD AS "Cantidad",
    PRECIO_UNITARIO AS "Precio unitario",
    ID_COMPRA AS "Identificador de compra"
FROM DETALLE_COMPRAS;
/
