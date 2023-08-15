CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_OBTENER_PKG AS
    /* Procedimientos para departamentos */
    PROCEDURE obtener_compras(compras_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_roles(roles_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_permisos(permisos_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_proveedores(proveedores_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_almacenes(almacenes_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_equipos(equipos_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_departamentos(departamentos_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_personal(personal_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_recepciones(recepciones_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_despachos(despachos_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_usuarios(usuarios_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_detalle_compras(detalle_compras_cursor OUT SYS_REFCURSOR);
    PROCEDURE obtener_categorias(categorias_cursor OUT SYS_REFCURSOR);

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
  /* Procedimientos para categorías */
  PROCEDURE eliminar_categoria(id_categoria IN INT);
  /* Procedimientos para el detalle de compras */
  PROCEDURE eliminar_detalle_compra(id_detalle_compra IN INT);
  --PROCEDURE eliminar_proveedor_y_compras(id_proveedor IN INT);
  
  
END INVENTARIO_MGMT_ELIMINAR_PKG;

CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_CREAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE crear_equipos(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                         num_serie IN VARCHAR2, cantidad_disponible IN INT,
                         id_categoria IN INT, o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para departamentos */
  PROCEDURE crear_departamentos(id_departamento IN INT, nombre_departamento IN VARCHAR2,
                               o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para roles */
  PROCEDURE crear_roles(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2,
                      o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para proveedores */
  PROCEDURE crear_proveedores(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para recepciones */
  PROCEDURE crear_recepciones(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP,
                            o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para usuarios */
  PROCEDURE crear_usuarios(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT,
                          o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para categorías */
  PROCEDURE crear_categorias(id_categoria IN INT, nombre_categoria IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR);

  /* Procedimientos para el detalle de compras */
  PROCEDURE crear_detalle_compras(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL,
                                 id_compra IN INT, o_c_dbuser OUT SYS_REFCURSOR);
  /* Procedimientos para compras */
  PROCEDURE crear_compras(id_compra IN INT, id_proveedor IN INT, fecha_compra IN DATE, o_c_dbuser OUT SYS_REFCURSOR);                               
                             
  /* Procedimientos para almacenes */
  PROCEDURE crear_almacenes(id_almacen IN INT, nombre_almacen IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR);
  /* Procedimientos para permisos */
  PROCEDURE crear_permisos(
      p_id_permisos IN PERMISOS.ID_PERMISOS%TYPE,
      p_nombre IN PERMISOS.NOMBRE%TYPE,
      p_id_rol IN PERMISOS.ID_ROL%TYPE,
      p_descripcion IN PERMISOS.DESCRIPCION%TYPE,
      o_c_dbuser OUT SYS_REFCURSOR
  );

  /* Procedimientos para despachos */
  PROCEDURE crear_despachos(
      p_id_despacho IN DESPACHOS.ID_DESPACHO%TYPE,
      p_id_equipo IN DESPACHOS.ID_EQUIPO%TYPE,
      p_id_departamento IN DESPACHOS.ID_DEPARTAMENTO%TYPE,
      p_fecha IN DESPACHOS.FECHA%TYPE,
      p_hora IN DESPACHOS.HORA%TYPE,
      p_id_personal IN DESPACHOS.ID_PERSONAL%TYPE,
      o_c_dbuser OUT SYS_REFCURSOR
  );

  /* Procedimientos para personal */
  PROCEDURE crear_personal(
      p_id_personal IN PERSONAL.ID_PERSONAL%TYPE,
      p_nombre IN PERSONAL.NOMBRE%TYPE,
      p_telefono IN PERSONAL.TELEFONO%TYPE,
      p_correo IN PERSONAL.CORREO%TYPE,
      p_id_departamento IN PERSONAL.ID_DEPARTAMENTO%TYPE,
      o_c_dbuser OUT SYS_REFCURSOR
  );                       

END INVENTARIO_MGMT_CREAR_PKG;

CREATE OR REPLACE PACKAGE INVENTARIO_MGMT_ACTUALIZAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE actualizar_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                              num_serie IN VARCHAR2, cantidad_disponible IN INT, id_categoria IN INT);
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
  /* Procedimientos para categorías */
  PROCEDURE actualizar_categoria(id_categoria IN INT, nombre_categoria IN VARCHAR2);
  /* Procedimientos para el detalle de compras */
  PROCEDURE actualizar_detalle_compra(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL);
  --PROCEDURE actualizar_cantidad_disponibles(equipo_id IN INT, nueva_cantidad IN INT);
END INVENTARIO_MGMT_ACTUALIZAR_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_OBTENER_PKG AS
 
    PROCEDURE obtener_compras(compras_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN compras_cursor FOR
        SELECT *
        FROM vista_compras;
    END;

    PROCEDURE obtener_roles(roles_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN roles_cursor FOR
        SELECT *
        FROM vista_roles;
    END;

    PROCEDURE obtener_permisos(permisos_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN permisos_cursor FOR
        SELECT *
        FROM vista_permisos;
    END;

    PROCEDURE obtener_proveedores(proveedores_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN proveedores_cursor FOR
        SELECT *
        FROM vista_proveedores;
    END;

    PROCEDURE obtener_almacenes(almacenes_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN almacenes_cursor FOR
        SELECT *
        FROM vista_almacenes;
    END;

    PROCEDURE obtener_equipos(equipos_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN equipos_cursor FOR
        SELECT *
        FROM vista_equipos;
    END;

    PROCEDURE obtener_departamentos(departamentos_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN departamentos_cursor FOR
        SELECT *
        FROM vista_departamentos;
    END;

    PROCEDURE obtener_personal(personal_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN personal_cursor FOR
        SELECT *
        FROM vista_personal;
    END;

    PROCEDURE obtener_recepciones(recepciones_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN recepciones_cursor FOR
        SELECT *
        FROM vista_recepciones;
    END;

    PROCEDURE obtener_despachos(despachos_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN despachos_cursor FOR
        SELECT *
        FROM vista_despachos;
    END;

    PROCEDURE obtener_usuarios(usuarios_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN usuarios_cursor FOR
        SELECT *
        FROM vista_usuarios;
    END;

    PROCEDURE obtener_detalle_compras(detalle_compras_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN detalle_compras_cursor FOR
        SELECT *
        FROM vista_detalle_compras;
    END;
    
    PROCEDURE obtener_categorias(categorias_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN categorias_cursor FOR
        SELECT *
        FROM vista_categorias;
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

  /* Procedimientos para categorías */
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
  PROCEDURE crear_equipos(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                         num_serie IN VARCHAR2, cantidad_disponible IN INT, id_categoria IN INT,
                         o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO equipos (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible, id_categoria)
    VALUES (id_equipo, nombre_equipo, descripcion, num_serie, cantidad_disponible, id_categoria);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM equipos;
  END;

  /* Procedimientos para departamentos */
  PROCEDURE crear_departamentos(id_departamento IN INT, nombre_departamento IN VARCHAR2,
                               o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO departamentos (id_departamento, nombre_departamento)
    VALUES (id_departamento, nombre_departamento);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM departamentos;
  END;

  /* Procedimientos para roles */
  PROCEDURE crear_roles(id_rol IN INT, nombre IN VARCHAR2, descripcion IN VARCHAR2,
                      o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO roles (id_rol, nombre, descripcion)
    VALUES (id_rol, nombre, descripcion);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM roles;
  END;

  /* Procedimientos para proveedores */
  PROCEDURE crear_proveedores(id_proveedor IN INT, nombre IN VARCHAR2, telefono IN VARCHAR2, correo IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO proveedores (id_proveedor, nombre, telefono, correo)
    VALUES (id_proveedor, nombre, telefono, correo);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM proveedores;
  END;

  /* Procedimientos para recepciones */
  PROCEDURE crear_recepciones(id_recepcion IN INT, id_equipo IN INT, id_almacen IN INT, fecha IN DATE, hora IN TIMESTAMP,
                            o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO recepciones (id_recepcion, id_equipo, id_almacen, fecha, hora)
    VALUES (id_recepcion, id_equipo, id_almacen, fecha, hora);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM recepciones;
  END;

  /* Procedimientos para usuarios */
  PROCEDURE crear_usuarios(id_usuario IN INT, id_personal IN INT, username IN VARCHAR2, password IN VARCHAR2, id_rol IN INT,
                          o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO usuarios (id_usuarios, id_personal, username, password, id_rol)
    VALUES (id_usuario, id_personal, username, password, id_rol);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM usuarios;
  END;

  /* Procedimientos para categorías */
  PROCEDURE crear_categorias(id_categoria IN INT, nombre_categoria IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO categorias (id_categoria, nombre_categoria)
    VALUES (id_categoria, nombre_categoria);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM categorias;
  END;

  /* Procedimientos para el detalle de compras */
  PROCEDURE crear_detalle_compras(id_detalle_compra IN INT, material IN VARCHAR2, cantidad IN INT, precio_unitario IN DECIMAL, id_compra IN INT,
                                 o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO detalle_compras (id_detalle_compra, material, cantidad, precio_unitario)
    VALUES (id_detalle_compra, material, cantidad, precio_unitario);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM detalle_compras;
  END;
  
  /* Procedimientos para compras */
  PROCEDURE crear_compras (
    id_compra IN INT,
    id_proveedor IN INT,
    fecha_compra IN DATE,
    o_c_dbuser OUT SYS_REFCURSOR
)
AS
BEGIN
    INSERT INTO compras (id_compra, id_proveedor, fecha_compra)
    VALUES (id_compra, id_proveedor, fecha_compra);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM compras;
END;
  
/* Procedimientos para almacenes */
  PROCEDURE crear_almacenes(id_almacen IN INT, nombre_almacen IN VARCHAR2,
                            o_c_dbuser OUT SYS_REFCURSOR)
  AS
  BEGIN
    INSERT INTO almacenes (id_almacen, nombre_almacen)
    VALUES (id_almacen, nombre_almacen);
    COMMIT;
    
    OPEN o_c_dbuser FOR
    SELECT *
    FROM almacenes;
  END;
  
  -- Procedimiento para la tabla PERMISOS
  PROCEDURE crear_permisos(
    p_id_permisos IN PERMISOS.ID_PERMISOS%TYPE,
    p_nombre IN PERMISOS.NOMBRE%TYPE,
    p_id_rol IN PERMISOS.ID_ROL%TYPE,
    p_descripcion IN PERMISOS.DESCRIPCION%TYPE,
    o_c_dbuser OUT SYS_REFCURSOR
)
AS
BEGIN
    INSERT INTO PERMISOS (ID_PERMISOS, NOMBRE, ID_ROL, DESCRIPCION)
    VALUES (p_id_permisos, p_nombre, p_id_rol, p_descripcion);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM PERMISOS;
END;


-- Procedimiento para la tabla DESPACHOS
   PROCEDURE crear_despachos(
    p_id_despacho IN DESPACHOS.ID_DESPACHO%TYPE,
    p_id_equipo IN DESPACHOS.ID_EQUIPO%TYPE,
    p_id_departamento IN DESPACHOS.ID_DEPARTAMENTO%TYPE,
    p_fecha IN DESPACHOS.FECHA%TYPE,
    p_hora IN DESPACHOS.HORA%TYPE,
    p_id_personal IN DESPACHOS.ID_PERSONAL%TYPE,
    o_c_dbuser OUT SYS_REFCURSOR
)
AS
BEGIN
    INSERT INTO DESPACHOS (ID_DESPACHO, ID_EQUIPO, ID_DEPARTAMENTO, FECHA, HORA, ID_PERSONAL)
    VALUES (p_id_despacho, p_id_equipo, p_id_departamento, p_fecha, p_hora, p_id_personal);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM DESPACHOS;
END;


-- Procedimiento para la tabla PERSONAL
 PROCEDURE crear_personal(
    p_id_personal IN PERSONAL.ID_PERSONAL%TYPE,
    p_nombre IN PERSONAL.NOMBRE%TYPE,
    p_telefono IN PERSONAL.TELEFONO%TYPE,
    p_correo IN PERSONAL.CORREO%TYPE,
    p_id_departamento IN PERSONAL.ID_DEPARTAMENTO%TYPE,
    o_c_dbuser OUT SYS_REFCURSOR
)
AS
BEGIN
    INSERT INTO PERSONAL (ID_PERSONAL, NOMBRE, TELEFONO, CORREO, ID_DEPARTAMENTO)
    VALUES (p_id_personal, p_nombre, p_telefono, p_correo, p_id_departamento);
    COMMIT;

    OPEN o_c_dbuser FOR
    SELECT *
    FROM PERSONAL;
END;


END INVENTARIO_MGMT_CREAR_PKG;

CREATE OR REPLACE PACKAGE BODY INVENTARIO_MGMT_ACTUALIZAR_PKG AS
  /* Procedimientos para equipos */
  PROCEDURE actualizar_equipo(id_equipo IN INT, nombre_equipo IN VARCHAR2, descripcion IN VARCHAR2,
                              num_serie IN VARCHAR2, cantidad_disponible IN INT, id_categoria IN INT)
  AS
  BEGIN
    UPDATE equipos
    SET nombre_equipo = nombre_equipo,
        descripcion = descripcion,
        num_serie = num_serie,
        cantidad_disponible = cantidad_disponible,
        id_categoria = id_categoria
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

  /* Procedimientos para categorías */
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

