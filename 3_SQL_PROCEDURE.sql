--Procedimientos PROCEDURE

--PROCEDIMIENTO CRUD PARA TODOS LOS EQUIPOS DISPONIBLES

CREATE OR REPLACE PROCEDURE obtener_equipos_disponibles(
    equipos_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN equipos_cursos FOR
    SELECT *
    FROM equipos
    WHERE cantidad_disponible > 0;
END;

CREATE OR REPLACE PROCEDURE crear_equipo(
    id_equipo IN INT,
    nombre_equipo IN VARCHAR2,
    descripcion IN VARCHAR2,
    num_serie IN VARCHAR2,
    cantidad_disponible IN INT,
    categoria IN INT
)
AS
BEGIN
    INSERT INTO equipos (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible,
    categoria)
    VALUES (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible,
    categoria)
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_equipo(
    id_equipo IN INT,
    nombre_equipo IN VARCHAR2,
    descripcion IN VARCHAR2,
    num_serie IN VARCHAR2,
    cantidad_disponible IN INT,
    categoria IN INT
)
AS
BEGIN
    UPDATE equipos
    SET nombre_equipo = nombre_equipo,
        descripcion = descripcion,
        num_serie = num_serie,
        cantidad_disponible = cantidad_disponible,
        categoria = categoria
    WHERE id_equipo = id_equipo
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_equipo(
    id_equipo IN INT
)
AS
BEGIN
    DELETE FROM equipos
    WHERE id_equipo = id_equipo;
    COMMIT;
END;
    

--PROCEDIMIENTO PARA OBTENER LAS LISTA DE DEPARTAMENTOS 

CREATE OR REPLACE PROCEDURE obtener_departamentos(
    departamentos_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN departamentos_cursor FOR
    SELECT *
    FROM departamentos;
END;

CREATE OR REPLACE PROCEDURE crear_departamento(
    id_departamento IN INT,
    nombre_departamento IN VARCHAR2
)
AS
BEGIN
    INSERT INTO departamentos (id_departamento, nombre_departamento)
    VALUES (id_departamento, nombre_departamento);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_departamento(
    id_departamento IN INT,
    nombre_departamento IN VARCHHAR2
)
AS
BEGIN
    UPDATE departamentos
    SET nombre_departamento = nombre_departamento
    WHERE id_departamento = id_departamento;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_departamento(
    id_departamento IN INT
)
AS
BEGIN
    DELETE FROM departamentos
    WHERE id_departamento = id_departamento;
    COMMIT;
END;


--PROCEDIMIENTO PARA OBTENER ROLES DE USUARIO

CREATE OR REPLACE PROCEDURE obtener_roles(
    roles_cursor OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN roles_cursor FOR
    SELECT *
    FROM roles;
END;

CREATE OR REPLACE PROCEDURE crear_rol(
    id_rol IN INT,
    nombre IN VARCHAR2,
    descripcion IN VARCHAR2
)
AS 
BEGIN
    INSERT INTO roles (id_rol, nombre, descripcion)
    VALUES (id_rol, nombre, descricion)
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_rol(
    id_rol IN INT,
    nombre IN VARCHAR2,
    descripcion IN VARCHAR2
)
AS 
BEGIN
    UPDATE roles
    SET nombre = nombre,
        descripcion = descripcion
    WHERE id_rol = id_rol;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_rol(
    id_rol IN INT
)
AS
BEGIN
    DELETE FROM roles
    WHERE id_rol = id_rol;
    COMMIT;
END;


--PROCEDIMIENTO PARA OBTENER LOS PROVEEDORES POR NOMBRE 

CREATE OR REPLACE PROCEDURE obtener_proveedores_por_nombre(
    nombre_proveedor IN VARCHAR2,
    proveedores_cursor OUT SYS_REFCURSOR
)
AS
BEGIN 
    OPEN proveedores_cursor FOR
    SELECT *
    FROM proveedores
    WHERE nombre LIKE '%' || nombre_proveedor || '%';
END;

CREATE OR REPLACE PROCEDURE crear_proveedor(
    id_proveedor IN INT,
    nombre IN VARCHAR2,
    telefono IN VARCHAR2,
    correo IN VARCHAR2
)
AS 
BEGIN
    INSERT INTO proveedores (id_proveedor, nombre, telefono, correo)
    VALUES (id_proveedor, nombre, telefono, correo);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_proveedor(
    id_proveedor IN INT,
    nombre IN VARCHAR2,
    telefono IN VARCHAR2,
    correo IN VARCHAR2
)
AS
BEGIN
    UPDATE proveedures
    SET nombre = nombre,
        telefono = telefono;
        correo = correo
    WHERE id_proveedor = id_proveedor;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_proveedor(
    id_proveedor IN INT
)
AS
BEGIN
    DELETE FROM proveedores
    WHERE id_proveedor = id_proveedor;
    COMMIT;
END;

--PROCEDIMIENTO PARA OBTENER LAS RECEPCIONES POR FECHA

CREATE OR REPLACE PROCEDURE obtener_recepciones_por_fecha(
    fecha_recepcion IN DATE,
    recepciones_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN recepciones_cursor FOR
    SELECT *
    FROM recepciones
    WHERE fecha = fecha_recepcion;
END;

CREATE OR REPLACE PROCEDURE crear_recepcion(
    id_recepcion IN INT,
    id_equipo IN INT,
    id_almacen IN INT,
    fecha IN DATE,
    hora IN TIMESTAMP
)
AS
BEGIN
    INSERT INTO recepciones (id_recepcion, id_equipo, id_almacen, fecha, hora)
    VALUES (id_recepcion, id_equipo, id_almacen, fecha, hora);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_recepcion(
    id_recepcion IN INT,
    id_equipo IN INT,
    id_almacen IN INT,
    fecha IN DATE,
    hora IN TIMESTAMP
)
AS
BEGIN
    UPDATE recepciones
    SET id_equipo = id_equipo,
        id_almacen = id_almacen,
        fecha = fecha,
        hora = hora
    WHERE id_recepcion = id_recepcion;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_recepcion(
    id_recepcion IN INT
)
AS
BEGIN
    DELETE FROM recepciones
    WHERE id_recepcion = id_recepcion;
    COMMIT;
END;


--PROCEDIMIENTO PARA OBTENER LOS USUARIOS POR DEPARTAMENTO

CREATE OR REPLACE PROCEDURE obtener_usuarios_por_departamento(
    departamento_id IN INT,
    usuarios_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN usuarios_cursor FOR
    SELECT *
    FROM usuarios
    WHERE id_departamento = departamento_id;
END;

CREATE OR REPLACE PROCEDURE crear_usuario(
    id_usuario IN INT,
    id_personal IN INT,
    username IN VARCHAR2,
    password IN VARCHAR2,
    id_rol IN INT
)
AS 
BEGIN
    INSERT INTO usuarios (id_usuario, id_personal, username, password, id_rol)
    VALUES (id_usuario, id_personal, username, password, id_rol);
    COMMIT;
END;

CREATE FOR REPLACE PROCEDURE actualizar_usuario(
    id_usuario IN INT,
    id_personal IN INT, 
    username IN VARCHAR2,
    password IN VARCHAR2,
    id_rol IN INT
)
AS
BEGIN
    UPDATE usuarios
    SET id_personal = id_personal,
        username = username,
        password = password,
        id_rol = id_rol
    WHERE id_usuario = id_usuario;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_usuario(
    id_usuario IN INT
)
AS 
BEGIN
    DELETE FROM usuarios
    WHERE id_usuario = id_usuario;
    COMMIT;
END;

--PROCEDIMIENTO PARA OBTENER LA CANTIDAD TOTAL DE EQUIPOS POR CATEGORIA

CREATE OR REPLACE PROCEDURE obtener_cantidad_equipos_por_categoria(
    categoria_id IN INT,
    cantidad_equipos OUT INT
)
AS
BEGIN
    SELECT COUNT(*)
    INTO cantidad_equipos
    FROM equipos
    WHERE categoria = categoria_id;
END;

CREATE OR REPLACE PROCEDURE crear_categoria(
    id_categoria IN INT,
    nombre_categoria IN VARCHAR2
)
AS
BEGIN
    INSERT INTO categorias (id_categoria, nombre_categoria)
    VALUES (id_categoria, nombre_categoria);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_categoria(
    id_categoria IN INT,
    nombre_categoria IN VARCHAR2
)
AS
BEGIN
    UPDATE categorias
    SET nombre_categoria = nombre_categoria
    WHERE id_categoria = id_categoria;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_categoria(
    id_categoria IN INT
)
AS
BEGIN
    DELETE FROM categorias
    WHERE id_categoria = id_categoria;
    COMMIT;
END;

--PROCEDIMIENTTO PARA OBTENER EL DETALLE DE UNA COMPRA

CREATE OR REPLACE PROCEDURE obtener_detalle_compra(
    compra_id IN INT,
    detalle_compra_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN detalle_compra_cursor FOR
    SELECT *
    FROM detalle_compra
    WHERE id_compra = compra_id;
END;

CREATE OR REPLACE PROCEDURE crear_detalle_compra(
    id_detalle_compra IN INT,
    materia IN VARCHAR2,
    cantidad IN INT,
    precio_unitario IN DECIMAL
)
AS 
BEGIN
    INSERT INTO detalle_compra (id_detalle_compra, material, cantidad, precio_unitario)
    VALUES (id_detalle_compra, material, cantidad, precio_unitario);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE actualizar_detalle_compra(
    id_detalle_compra IN INT,
    material IN VARCHAR2,
    cantidad IN INT,
    precio_unitario IN DECIMAL
)
AS
BEGIN
    UPDATE detalle_compra
    SET material = material,
        cantidad = cantidad,
        precio_unitario = precio_unitario
    WHERE id_detalle_compra = id_detalle_compra;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE eliminar_detalle_compra(
    id_detalle_compra IN INT
)
AS
BEGIN
    DELETE FROM detalle_compra
    WHERE id_detalle_compra = id_detalle_compra;
    COMMIT;
END;


--PROCEDIMIENTO PARA ACTUALIZAR LA CANTIDAD DISPONIBLE DE UN EQUIPO
--Ya se incluyo en los procedimientos del CRUD de equipos anteriormente

CREATE OR REPLACE PROCEDURE actualizar_cantidad_disponibles(
    equipo_id IN INT,
    nueva_cantidad IN INT
)
AS
BEGIN
    UPDATE equipos
    SET cantidad_disponible = nueva_cantidad
    WHERE id_equipo = equipo_id;
    COMMIT;
END;


--PROCEDIMIENTO PARA ELIMINAR UN PROVEEDOR Y SUS COMPRAS ASOCIADAS 
--Ya se incluyo en los procedimientos del CRUD de proveedores.

CREATE OR REPLACE PROCEDURE eliminar_proveedor(
    id_proveedor IN INT
)
AS
BEGIN
    DELETE FROM compras
    WHERE id_proveedor = id_proveedor;
    
    DELETE FROM proveedores
    WHERE id_proveedor = id_proveedor;
    COMMIT;
END;


--PROCEDIMIENTO PARA OBTENER EQUIPOS RECIBIDOS EN UNA FECHA Y DEPARTAMENTO ESPECIFICO
--Ya se incluyo en los procedimientos del CRUD de recepciones y equipos

CREATE OR REPLACE PROCEDURE obtener_equipos_recibidos(
    fecha_recepcion IN DATE,
    departamento_id IN INT,
    equipos_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN equipos_cursor FOR
    SELECT e.*
    FROM equipos e
    INNER JOIN recepciones r ON e.id_equipo = r.id_equipo
    WHERE r.fecha = fecha_recepcion
    AND r.id_departamento = departamento_id;
END;

--PROCEDIMIENTO ALMACENADO PARA OBTENER EL TOTAL DE INVENTARIO

CREATE OR REPLACE PROCEDURE obtener_total_inventario(
    total OUT INT
)
AS
BEGIN
    SELECT SUM(cantidad_disponible)
    INTO total
    FROM inventario,
END;

--procedimientos de login
CREATE OR REPLACE PROCEDURE verifica_login_prc(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    o_result OUT VARCHAR2
)
AS
BEGIN
    o_result := verifica_login_fun(p_username, p_password);
END;
/




