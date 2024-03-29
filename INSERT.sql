-- tabla "CATEGORIAS"
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (1, 'Categor�a 1');

INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (2, 'Categor�a 2');

INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (3, 'Categor�a 3');

INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA)
VALUES (4, 'Categor�a 4');

-- tabla "DEPARTAMENTOS"
INSERT INTO DEPARTAMENTOS (ID_DEPARTAMENTO, NOMBRE_DEPARTAMENTO)
VALUES (1, 'Departamento 1');

INSERT INTO DEPARTAMENTOS (ID_DEPARTAMENTO, NOMBRE_DEPARTAMENTO)
VALUES (2, 'Departamento 2');

-- tabla "ROLES"
INSERT INTO ROLES (ID_ROL, NOMBRE, DESCRIPCION)
VALUES (1, 'administracion', 'CRUD');

INSERT INTO ROLES (ID_ROL, NOMBRE, DESCRIPCION)
VALUES (2, 'lectura', 'READ');

INSERT INTO ROLES (ID_ROL, NOMBRE, DESCRIPCION)
VALUES (3, 'actualizacion', 'UPDATE');

INSERT INTO ROLES (ID_ROL, NOMBRE, DESCRIPCION)
VALUES (4, 'creacion', 'CREATE');

INSERT INTO ROLES (ID_ROL, NOMBRE, DESCRIPCION)
VALUES (5, 'eliminacion', 'DELETE');

-- tabla "PERSONAL"
INSERT INTO PERSONAL (ID_PERSONAL, NOMBRE, TELEFONO, CORREO, ID_DEPARTAMENTO)
VALUES (1, 'Persona 1', '123456789', 'persona1@correo.com', 1);

INSERT INTO PERSONAL (ID_PERSONAL, NOMBRE, TELEFONO, CORREO, ID_DEPARTAMENTO)
VALUES (2, 'Persona 2', '987654321', 'persona2@correo.com', 2);

-- tabla "EQUIPOS"
INSERT INTO EQUIPOS (ID_EQUIPO, NOMBRE_EQUIPO, DESCRIPCION, NUM_SERIE, CANTIDAD_DISPONIBLE, ID_CATEGORIA)
VALUES (1, 'Equipo 1', 'Descripci�n del Equipo 1', 'NS001', 10, 1);

INSERT INTO EQUIPOS (ID_EQUIPO, NOMBRE_EQUIPO, DESCRIPCION, NUM_SERIE, CANTIDAD_DISPONIBLE, ID_CATEGORIA)
VALUES (2, 'Equipo 2', 'Descripci�n del Equipo 2', 'NS002', 5, 2);

-- tabla "PERMISOS"
INSERT INTO PERMISOS (ID_PERMISOS, NOMBRE, ID_ROL, DESCRIPCION)
VALUES (1, 'Permiso 1', 1, 'Descripci�n del Permiso 1');

INSERT INTO PERMISOS (ID_PERMISOS, NOMBRE, ID_ROL, DESCRIPCION)
VALUES (2, 'Permiso 2', 2, 'Descripci�n del Permiso 2');

-- tabla "PROVEEDORES"
INSERT INTO PROVEEDORES (ID_PROVEEDOR, NOMBRE, TELEFONO, CORREO)
VALUES (1, 'Proveedor 1', '555-123456', 'proveedor1@correo.com');

INSERT INTO PROVEEDORES (ID_PROVEEDOR, NOMBRE, TELEFONO, CORREO)
VALUES (2, 'Proveedor 2', '555-987654', 'proveedor2@correo.com');

-- tabla "ALMACENES"
INSERT INTO ALMACENES (ID_ALMACEN, NOMBRE_ALMACEN)
VALUES (1, 'Almac�n 1');

INSERT INTO ALMACENES (ID_ALMACEN, NOMBRE_ALMACEN)
VALUES (2, 'Almac�n 2');

-- tabla "RECEPCIONES"
INSERT INTO RECEPCIONES (ID_RECEPCION, ID_EQUIPO, ID_ALMACEN, FECHA, HORA)
VALUES (1, 1, 1, CURRENT_DATE, CURRENT_TIMESTAMP);

INSERT INTO RECEPCIONES (ID_RECEPCION, ID_EQUIPO, ID_ALMACEN, FECHA, HORA)
VALUES (2, 2, 2, CURRENT_DATE, CURRENT_TIMESTAMP);

-- tabla "USUARIOS"
INSERT INTO USUARIOS (ID_USUARIOS, ID_PERSONAL, USERNAME, PASSWORD, ID_ROL)
VALUES (1, 1, 'usuario1', dbms_random.string('p',10), 1);

INSERT INTO USUARIOS (ID_USUARIOS, ID_PERSONAL, USERNAME, PASSWORD, ID_ROL)
VALUES (2, 2, 'usuario2', dbms_random.string('p',10), 2);

-- tabla "COMPRA"
INSERT INTO COMPRAS (ID_COMPRA, ID_PROVEEDOR, FECHA_COMPRA)
VALUES (1, 1, CURRENT_DATE);

INSERT INTO COMPRAS (ID_COMPRA, ID_PROVEEDOR, FECHA_COMPRA)
VALUES (2, 2, CURRENT_DATE);

-- tabla "DETALLE_COMPRA"
INSERT INTO DETALLE_COMPRAS (ID_DETALLE_COMPRA, MATERIAL, CANTIDAD, PRECIO_UNITARIO, ID_COMPRA)
VALUES (1, 'Material 1', 10, 50.00, 1);

INSERT INTO DETALLE_COMPRAS (ID_DETALLE_COMPRA, MATERIAL, CANTIDAD, PRECIO_UNITARIO, ID_COMPRA)
VALUES (2, 'Material 2', 5, 30.00, 2);

-- Tabla "CATEGOR�AS"
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA) VALUES
(1, 'Inyecciones');
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA) VALUES
(2, 'Suero');
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA) VALUES
(3, 'Alcohol');
INSERT INTO CATEGORIAS (ID_CATEGORIA, NOMBRE_CATEGORIA) VALUES
(4, 'Vendas');

COMMIT;

