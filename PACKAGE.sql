CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_OBTENER_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE obtener_equipos_disponibles(equipos_cursor OUT SYS_REFCURSOR);
  PROCEDURE obtener_departamentos(departamentos_cursor OUT SYS_REFCURSOR);
  PROCEDURE obtener_recepciones_por_fecha(fecha_recepcion IN DATE, recepciones_cursor OUT SYS_REFCURSOR);
  PROCEDURE obtener_usuarios_por_departamento(departamento_id IN INT, usuarios_cursor OUT SYS_REFCURSOR);
  PROCEDURE obtener_detalle_compra(compra_id IN INT, detalle_compra_cursor OUT SYS_REFCURSOR);
  PROCEDURE obtener_equipos_recibidos(fecha_recepcion IN DATE, departamento_id IN INT, equipos_cursor OUT SYS_REFCURSOR);
END INVENTARIO_MGMT_OBTENER_PKG;

CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_ELIMINAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE eliminar_equipo(id_equipo IN INT);
  /* Procedimientos para departamentos */
  PROCEDURE eliminar_departamento(id_departamento IN INT);
  /* Procedimientos para roles */
  PROCEDURE eliminar_rol(id_rol IN INT);
  /* Procedimientos para proveedores */
  PROCEDURE eliminar_proveedor(id_proveedor IN INT);
  /* Procedimientos para recepciones */
  PROCEDURE eliminar_recepcion(id_recepcion IN INT);
  /* Procedimientos para usuarios */
  PROCEDURE eliminar_usuario(id_usuario IN INT);
  /* Procedimientos para categor�as */
  PROCEDURE eliminar_categoria(id_categoria IN INT);
  /* Procedimientos para el detalle de compras */
  PROCEDURE eliminar_detalle_compra(id_detalle_compra IN INT);
  --PROCEDURE eliminar_proveedor_y_compras(id_proveedor IN INT);
END INVENTARIO_MGMT_ELIMINAR_PKG;

CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_CREAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE crear_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                         num_serie IN VARCHAR2, cantidad_disponible IN INT, categoria IN INT);
  /* Procedimientos para departamentos */
  PROCEDURE crear_departamento(id_departamento IN INT, nombre_departamento IN VARCHAR2);
  /* Procedimientos para roles */
  PROCEDURE crear_rol(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2);
  /* Procedimientos para proveedores */
  PROCEDURE crear_proveedor(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2);
  /* Procedimientos para recepciones */
  PROCEDURE crear_recepcion(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP);
  /* Procedimientos para usuarios */
  PROCEDURE crear_usuario(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT);
  /* Procedimientos para categor�as */
  PROCEDURE crear_categoria(id_categoria IN INT, nombre_categoria IN VARCHAR2);
  /* Procedimientos para el detalle de compras */
  PROCEDURE crear_detalle_compra(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL);
END INVENTARIO_MGMT_CREAR_PKG;

CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_ACTUALIZAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE actualizar_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                              num_serie IN VARCHAR2, cantidad_disponible IN INT, categoria IN INT);
  /* Procedimientos para departamentos */
  PROCEDURE actualizar_departamento(id_departamento IN INT, nombre_departamento IN VARCHAR2);
  /* Procedimientos para roles */
  PROCEDURE actualizar_rol(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2);
  /* Procedimientos para proveedores */
  PROCEDURE actualizar_proveedor(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2);
  /* Procedimientos para recepciones */
  PROCEDURE actualizar_recepcion(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP);
  /* Procedimientos para usuarios */
  PROCEDURE actualizar_usuario(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT);
  /* Procedimientos para categor�as */
  PROCEDURE actualizar_categoria(id_categoria IN INT, nombre_categoria IN VARCHAR2);
  /* Procedimientos para el detalle de compras */
  PROCEDURE actualizar_detalle_compra(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL);
  --PROCEDURE actualizar_cantidad_disponibles(equipo_id IN INT, nueva_cantidad IN INT);
END INVENTARIO_MGMT_ACTUALIZAR_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_OBTENER_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE obtener_equipos_disponibles(equipos_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN equipos_cursor FOR
    SELECT *
    FROM vista_equipo
    WHERE cantidad_disponible > 0;
  END;

  /* Procedimientos para departamentos */
  PROCEDURE obtener_departamentos(departamentos_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN departamentos_cursor FOR
    SELECT *
    FROM departamentos;
  END;

  /* Procedimientos para recepciones */
  PROCEDURE obtener_recepciones_por_fecha(fecha_recepcion IN DATE, recepciones_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN recepciones_cursor FOR
    SELECT *
    FROM recepciones
    WHERE fecha = fecha_recepcion;
  END;

  /* Procedimientos para usuarios */
  PROCEDURE obtener_usuarios_por_departamento(departamento_id IN INT, usuarios_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN usuarios_cursor FOR
    SELECT *
    FROM usuarios u
    INNER JOIN personal p ON u.id_personal = p.id_personal
    WHERE p.id_departamento = departamento_id;
  END;

  /* Procedimientos para el detalle de compras */
  PROCEDURE obtener_detalle_compra(compra_id IN INT, detalle_compra_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN detalle_compra_cursor FOR
    SELECT *
    FROM detalle_compra
    WHERE id_detalle_compra = compra_id;
  END;

  /* Procedimientos adicionales */
  PROCEDURE obtener_equipos_recibidos(fecha_recepcion IN DATE, departamento_id IN INT, equipos_cursor OUT SYS_REFCURSOR)
  AS
  BEGIN
    OPEN equipos_cursor FOR
    SELECT e.*
    FROM equipos e
    INNER JOIN recepciones r ON e.id_equipo = r.id_equipo
    INNER JOIN despachos d ON e.id_equipo = d.id_equipo
    WHERE r.fecha = fecha_recepcion
    AND d.id_departamento = departamento_id;
  END;
END INVENTARIO_MGMT_OBTENER_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_ELIMINAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE eliminar_equipo(id_equipo IN INT)
  AS
  BEGIN
    DELETE FROM equipos
    WHERE id_equipo = id_equipo;
    COMMIT;
  END;

  /* Procedimientos para departamentos */
  PROCEDURE eliminar_departamento(id_departamento IN INT)
  AS
  BEGIN
    DELETE FROM departamentos
    WHERE id_departamento = id_departamento;
    COMMIT;
  END;

  /* Procedimientos para roles */
  PROCEDURE eliminar_rol(id_rol IN INT)
  AS
  BEGIN
    DELETE FROM roles
    WHERE id_rol = id_rol;
    COMMIT;
  END;

  /* Procedimientos para proveedores */
  PROCEDURE eliminar_proveedor(id_proveedor IN INT)
  AS
  BEGIN
    DELETE FROM proveedores
    WHERE id_proveedor = id_proveedor;
    COMMIT;
  END;

  /* Procedimientos para recepciones */
  PROCEDURE eliminar_recepcion(id_recepcion IN INT)
  AS
  BEGIN
    DELETE FROM recepciones
    WHERE id_recepcion = id_recepcion;
    COMMIT;
  END;

  /* Procedimientos para usuarios */
  PROCEDURE eliminar_usuario(id_usuario IN INT)
  AS
  BEGIN
    DELETE FROM usuarios
    WHERE id_usuarios = id_usuario;
    COMMIT;
  END;

  /* Procedimientos para categor�as */
  PROCEDURE eliminar_categoria(id_categoria IN INT)
  AS
  BEGIN
    DELETE FROM categorias
    WHERE id_categoria = id_categoria;
    COMMIT;
  END;

  /* Procedimientos para el detalle de compras */
  PROCEDURE eliminar_detalle_compra(id_detalle_compra IN INT)
  AS
  BEGIN
    DELETE FROM detalle_compra
    WHERE id_detalle_compra = id_detalle_compra;
    COMMIT;
  END;
END INVENTARIO_MGMT_ELIMINAR_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_CREAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE crear_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                         num_serie IN VARCHAR2, cantidad_disponible IN INT, categoria IN INT)
  AS
  BEGIN
    INSERT INTO equipos (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible, categoria)
    VALUES (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible, categoria);
    COMMIT;
  END;

  /* Procedimientos para departamentos */
  PROCEDURE crear_departamento(id_departamento IN INT, nombre_departamento IN VARCHAR2)
  AS
  BEGIN
    INSERT INTO departamentos (id_departamento, nombre_departamento)
    VALUES (id_departamento, nombre_departamento);
    COMMIT;
  END;

  /* Procedimientos para roles */
  PROCEDURE crear_rol(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2)
  AS
  BEGIN
    INSERT INTO roles (id_rol, nombre, descripcion)
    VALUES (id_rol, nombre, descripcion);
    COMMIT;
  END;

  /* Procedimientos para proveedores */
  PROCEDURE crear_proveedor(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2)
  AS
  BEGIN
    INSERT INTO proveedores (id_proveedor, nombre, telefono, correo)
    VALUES (id_proveedor, nombre, telefono, correo);
    COMMIT;
  END;

  /* Procedimientos para recepciones */
  PROCEDURE crear_recepcion(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP)
  AS
  BEGIN
    INSERT INTO recepciones (id_recepcion, id_equipo, id_almacen, fecha, hora)
    VALUES (id_recepcion, id_equipo, id_almacen, fecha, hora);
    COMMIT;
  END;

  /* Procedimientos para usuarios */
  PROCEDURE crear_usuario(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT)
  AS
  BEGIN
    INSERT INTO usuarios (id_usuarios, id_personal, username, password, id_rol)
    VALUES (id_usuario, id_personal, username, password, id_rol);
    COMMIT;
  END;

  /* Procedimientos para categor�as */
  PROCEDURE crear_categoria(id_categoria IN INT, nombre_categoria IN VARCHAR2)
  AS
  BEGIN
    INSERT INTO categorias (id_categoria, nombre_categoria)
    VALUES (id_categoria, nombre_categoria);
    COMMIT;
  END;

  /* Procedimientos para el detalle de compras */
  PROCEDURE crear_detalle_compra(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL)
  AS
  BEGIN
    INSERT INTO detalle_compra (id_detalle_compra, material, cantidad, precio_unitario)
    VALUES (id_detalle_compra, material, cantidad, precio_unitario);
    COMMIT;
  END;
END INVENTARIO_MGMT_CREAR_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_ACTUALIZAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE actualizar_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                              num_serie IN VARCHAR2, cantidad_disponible IN INT, categoria IN INT)
  AS
  BEGIN
    UPDATE equipos
    SET nombre_equipo = nombre_equipo,
        descripcion = descripcion,
        num_serie = num_serie,
        cantidad_disponible = cantidad_disponible,
        categoria = categoria
    WHERE id_equipo = id_equipo;
    COMMIT;
  END;

  /* Procedimientos para departamentos */
  PROCEDURE actualizar_departamento(id_departamento IN INT, nombre_departamento IN VARCHAR2)
  AS
  BEGIN
    UPDATE departamentos
    SET nombre_departamento = nombre_departamento
    WHERE id_departamento = id_departamento;
    COMMIT;
  END;

  /* Procedimientos para roles */
  PROCEDURE actualizar_rol(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2)
  AS
  BEGIN
    UPDATE roles
    SET nombre = nombre,
        descripcion = descripcion
    WHERE id_rol = id_rol;
    COMMIT;
  END;

  /* Procedimientos para proveedores */
  PROCEDURE actualizar_proveedor(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2)
  AS
  BEGIN
    UPDATE proveedores
    SET nombre = nombre,
        telefono = telefono,
        correo = correo
    WHERE id_proveedor = id_proveedor;
    COMMIT;
  END;

  /* Procedimientos para recepciones */
  PROCEDURE actualizar_recepcion(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP)
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

  /* Procedimientos para usuarios */
  PROCEDURE actualizar_usuario(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT)
  AS
  BEGIN
    UPDATE usuarios
    SET id_personal = id_personal,
        username = username,
        password = password,
        id_rol = id_rol
    WHERE id_usuarios = id_usuario;
    COMMIT;
  END;

  /* Procedimientos para categor�as */
  PROCEDURE actualizar_categoria(id_categoria IN INT, nombre_categoria IN VARCHAR2)
  AS
  BEGIN
    UPDATE categorias
    SET nombre_categoria = nombre_categoria
    WHERE id_categoria = id_categoria;
    COMMIT;
  END;

  /* Procedimientos para el detalle de compras */
  PROCEDURE actualizar_detalle_compra(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL)
  AS
  BEGIN
    UPDATE detalle_compra
    SET material = material,
        cantidad = cantidad,
        precio_unitario = precio_unitario
    WHERE id_detalle_compra = id_detalle_compra;
    COMMIT;
  END;
END INVENTARIO_MGMT_ACTUALIZAR_PKG;


--PRUEBAS
SET SERVEROUTPUT ON;
DECLARE
  equipos_cursor SYS_REFCURSOR;
  id_equipo equipos.id_equipo%TYPE;
  nombre_equipo equipos.nombre_equipo%TYPE;
  cantidad_disponible equipos.cantidad_disponible%TYPE; 
BEGIN
  
  INVENTARIO_MGMT_OBTENER_PKG.obtener_equipos_disponibles(equipos_cursor);
  
  LOOP

    FETCH equipos_cursor INTO id_equipo, nombre_equipo, cantidad_disponible; 
    
    EXIT WHEN equipos_cursor%NOTFOUND;    

    DBMS_OUTPUT.PUT_LINE('Equipo ID: ' || id_equipo || ', Nombre: ' || nombre_equipo || ', Cantidad Disponible: ' || cantidad_disponible);
  END LOOP;
  
  CLOSE equipos_cursor;
END;
