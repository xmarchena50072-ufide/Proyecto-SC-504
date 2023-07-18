CREATE VIEW vista_categorias AS
SELECT ID_CATEGORIA, NOMBRE_CATEGORIA FROM CATEGORIAS;

CREATE VIEW vista_equipo AS
SELECT ID_EQUIPO, NOMBRE_EQUIPO, DESCRIPCION, NUM_SERIE, CANTIDAD_DISPONIBLE, CATEGORIA FROM EQUIPOS;

CREATE VIEW vista_depto AS
SELECT ID_DEPARTAMENTO, NOMBRE_DEPARTAMENTO FROM DEPARTAMENTOS;

CREATE VIEW vista_personal AS
SELECT ID_PERSONAL, NOMBRE, TELEFONO , CORREO, ID_DEPARTAMENTO FROM PERSONAL;

CREATE VIEW vista_roles AS
SELECT ID_ROL, NOMBRE, DESCRIPCION FROM ROLES;

CREATE VIEW vista_permisos AS
SELECT ID_PERMISOS, NOMBRE, ID_ROL, DESCRIPCION FROM PERMISOS;

CREATE VIEW vista_prove AS
SELECT ID_PROVEEDORES, NOMBRE, TELEFONO, CORREO FROM PROVEEDORES;

CREATE VIEW vista_recepciones AS
SELECT ID_RECEPCION, ID_EQUIPO, ID_ALMACEN, FECHA, HORA FROM RECEPCIONES;

CREATE VIEW vista_almacenes AS
SELECT ID_ALMACEN, ID_RECEPCION, ID_EQUIPO, NOMBRE_ALMACEN FROM ALMACENES;

CREATE VIEW vista_despachos AS
SELECT ID_DESPACHO, ID_EQUIPO, ID_DEPARTAMENTO, FECHA, HORA, ID_PERSONAL
FROM DESPACHOS;

CREATE VIEW vista_usuario AS
SELECT ID_USUARIOS, ID_PERSONAL, USERNAME, PASSWORD, ID_ROL FROM USUARIOS;

CREATE VIEW vista_compra AS
SELECT ID_COMPRA, ID_PROVEEDOR, FECHA_COMPRA , ID_DETALLE_COMPRA FROM COMPRA;

CREATE VIEW vista_detalles AS
SELECT ID_DETALLE_COMPRA, MATERIAL, CANTIDAD, PRECIO_UNITARIO FROM DETALLE_COMPRA;