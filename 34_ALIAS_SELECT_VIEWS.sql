CREATE VIEW vista_categorias AS
SELECT
    ID_CATEGORIA AS "Identificador de categoría",
    NOMBRE_CATEGORIA AS "Nombre de la categoría"
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
    TELEFONO AS "Teléfono",
    CORREO AS "Correo",
    ID_DEPARTAMENTO AS "Identificador de departamento"
FROM PERSONAL;

CREATE VIEW vista_roles AS
SELECT
    ID_ROL AS "Identificador de rol",
    NOMBRE AS "Nombre de rol",
    DESCRIPCION AS "Descripción de rol"
FROM ROLES;

CREATE VIEW vista_permisos AS
SELECT
    ID_PERMISOS AS "Identificador de permisos",
    NOMBRE AS "Nombre de permiso",
    ID_ROL AS "Identificador de rol",
    DESCRIPCION AS "Descripción de permiso"
FROM PERMISOS;

CREATE VIEW vista_prove AS
SELECT
    ID_PROVEEDORES AS "Identificador de proveedor",
    NOMBRE AS "Nombre de proveedor",
    TELEFONO AS "Teléfono de proveedor",
    CORREO AS "Correo de proveedor"
FROM PROVEEDORES;

CREATE VIEW vista_recepciones AS
SELECT
    ID_RECEPCION AS "Identificador de recepción",
    ID_EQUIPO AS "Identificador de equipo",
    ID_ALMACEN AS "Identificador de almacén",
    FECHA AS "Fecha de recepción",
    HORA AS "Hora de recepción"
FROM RECEPCIONES;

CREATE VIEW vista_almacenes AS
SELECT
    ID_ALMACEN AS "Identificador de almacén",
    ID_RECEPCION AS "Identificador de recepción",
    ID_EQUIPO AS "Identificador de equipo en almacén",
    NOMBRE_ALMACEN AS "Nombre de almacén"
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
    PASSWORD AS "Contraseña",
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
