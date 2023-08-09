CREATE VIEW vista_categorias AS
SELECT
    ID_CATEGORIA AS "Identificador de categor�a",
    NOMBRE_CATEGORIA AS "Nombre de la categor�a"
FROM CATEGORIAS;

CREATE VIEW vista_equipo AS
SELECT
    ID_EQUIPO AS "Identificador de equipo",
    NOMBRE_EQUIPO AS "Nombre del equipo",
    CANTIDAD_DISPONIBLE AS "Cantidad disponible"
FROM EQUIPOS;

CREATE VIEW vista_depto AS
SELECT
    ID_DEPARTAMENTO AS "Identificador de departamento",
    NOMBRE_DEPARTAMENTO AS "Nombre del departamento"
FROM DEPARTAMENTOS;

CREATE VIEW vista_personal AS
SELECT
    ID_PERSONAL AS "Identificador de personal",
    NOMBRE AS "Nombre",
    TELEFONO AS "Tel�fono",
    CORREO AS "Correo",
    ID_DEPARTAMENTO AS "Identificador de departamento"
FROM PERSONAL;

CREATE VIEW vista_roles AS
SELECT
    ID_ROL AS "Identificador de rol",
    NOMBRE AS "Nombre de rol",
    DESCRIPCION AS "Descripci�n de rol"
FROM ROLES;

CREATE VIEW vista_permisos AS
SELECT
    ID_PERMISOS AS "Identificador de permisos",
    NOMBRE AS "Nombre de permiso",
    ID_ROL AS "Identificador de rol",
    DESCRIPCION AS "Descripci�n de permiso"
FROM PERMISOS;

CREATE VIEW vista_prove AS
SELECT
    ID_PROVEEDORES AS "Identificador de proveedor",
    NOMBRE AS "Nombre de proveedor",
    TELEFONO AS "Tel�fono de proveedor",
    CORREO AS "Correo de proveedor"
FROM PROVEEDORES;

CREATE VIEW vista_recepciones AS
SELECT
    ID_RECEPCION AS "Identificador de recepci�n",
    ID_EQUIPO AS "Identificador de equipo",
    ID_ALMACEN AS "Identificador de almac�n",
    FECHA AS "Fecha de recepci�n",
    HORA AS "Hora de recepci�n"
FROM RECEPCIONES;

CREATE VIEW vista_almacenes AS
SELECT
    ID_ALMACEN AS "Identificador de almac�n",
    ID_RECEPCION AS "Identificador de recepci�n",
    ID_EQUIPO AS "Identificador de equipo en almac�n",
    NOMBRE_ALMACEN AS "Nombre de almac�n"
FROM ALMACENES;

CREATE VIEW vista_despachos AS
SELECT
    ID_DESPACHO AS "Identificador de despacho",
    ID_EQUIPO AS "Identificador de equipo",
    ID_DEPARTAMENTO AS "Identificador de departamento",
    FECHA AS "Fecha de despacho",
    HORA AS "Hora de despacho",
    ID_PERSONAL AS "Identificador de personal"
FROM DESPACHOS;

CREATE VIEW vista_usuario AS
SELECT
    ID_USUARIOS AS "Identificador de usuario",
    ID_PERSONAL AS "Identificador de personal",
    USERNAME AS "Nombre de usuario",
    PASSWORD AS "Contrase�a",
    ID_ROL AS "Identificador de rol"
FROM USUARIOS;

CREATE VIEW vista_compra AS
SELECT
    ID_COMPRA AS "Identificador de compra",
    ID_PROVEEDOR AS "Identificador de proveedor",
    FECHA_COMPRA AS "Fecha de compra",
    ID_DETALLE_COMPRA AS "Identificador de detalle de compra"
FROM COMPRA;

CREATE VIEW vista_detalles AS
SELECT
    ID_DETALLE_COMPRA AS "Identificador de detalle de compra",
    MATERIAL AS "Material",
    CANTIDAD AS "Cantidad",
    PRECIO_UNITARIO AS "Precio unitario"
FROM DETALLE_COMPRA;
