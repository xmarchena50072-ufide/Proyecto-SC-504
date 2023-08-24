--Funciones llamadas desde package
--obtener la cantidad total de roles de usuario
CREATE OR REPLACE FUNCTION obtener_rol_usuario_fun(
    p_username IN VARCHAR2
)
RETURN VARCHAR2
AS
    v_rol VARCHAR2(50); 
BEGIN
    SELECT r.descripcion
    INTO v_rol
    FROM usuarios u
    JOIN roles r ON u.id_rol = r.id_rol 
    WHERE username = p_username;

    RETURN v_rol;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Usuario no encontrado';
    WHEN OTHERS THEN
        RETURN 'Error';
END;
/

--funciones de login
CREATE OR REPLACE FUNCTION verifica_login_fun(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_count NUMBER;
BEGIN
    --Si username y password existen en la tabla
    SELECT COUNT(*) INTO v_count
    FROM USUARIOS
    WHERE USERNAME = p_username AND PASSWORD = p_password;
    
    IF v_count > 0 THEN
        RETURN 'true';
    ELSE
        RETURN 'false';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'false';
    WHEN OTHERS THEN
        RETURN 'false';
END;
/
--Fin Funciones llamadas desde package

CREATE OR REPLACE FUNCTION obtener_id_usuario_por_nombre_fun(
    p_username IN VARCHAR2
)
RETURN NUMBER
IS
    v_id_usuario NUMBER;
BEGIN
    SELECT ID_USUARIOS INTO v_id_usuario
    FROM USUARIOS
    WHERE USERNAME = p_username;

    RETURN v_id_usuario;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN -1; -- Valor para indicar que no se encontró el usuario
    WHEN OTHERS THEN
        RETURN -2; -- Valor para indicar error
END;
/

CREATE OR REPLACE FUNCTION verifica_existencia_equipo_fun(
    p_nombre_equipo IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_resultado VARCHAR2(10);
BEGIN
    SELECT 'true' INTO v_resultado
    FROM EQUIPOS
    WHERE NOMBRE_EQUIPO = p_nombre_equipo;

    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'false';
    WHEN OTHERS THEN
        RETURN 'error';
END;
/

CREATE OR REPLACE FUNCTION verifica_existencia_departamento_fun(
    p_nombre_departamento IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_resultado VARCHAR2(10);
BEGIN
    SELECT 'true' INTO v_resultado
    FROM DEPARTAMENTOS
    WHERE NOMBRE_DEPARTAMENTO = p_nombre_departamento;

    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'false';
    WHEN OTHERS THEN
        RETURN 'error';
END;
/

CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_disponibles_categoria_fun(
    p_id_categoria IN INT
)
RETURN NUMBER
IS
    v_cantidad NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cantidad
    FROM EQUIPOS
    WHERE ID_CATEGORIA = p_id_categoria AND CANTIDAD_DISPONIBLE > 0;

    RETURN v_cantidad;
END;
/

CREATE OR REPLACE FUNCTION verifica_existencia_proveedor_fun(
    p_nombre_proveedor IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_resultado VARCHAR2(10);
BEGIN
    SELECT 'true' INTO v_resultado
    FROM PROVEEDORES
    WHERE NOMBRE = p_nombre_proveedor;

    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'false';
    WHEN OTHERS THEN
        RETURN 'error';
END;
/

CREATE OR REPLACE FUNCTION obtener_numero_serie_equipo_fun(
    p_id_equipo IN INT
)
RETURN VARCHAR2
IS
    v_numero_serie VARCHAR2(50);
BEGIN
    SELECT NUM_SERIE INTO v_numero_serie
    FROM EQUIPOS
    WHERE ID_EQUIPO = p_id_equipo;

    RETURN v_numero_serie;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Equipo no encontrado';
    WHEN OTHERS THEN
        RETURN 'Error';
END;
/

CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_recibidos_almacen_fun(
    p_id_almacen IN INT
)
RETURN NUMBER
IS
    v_cantidad NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cantidad
    FROM RECEPCIONES
    WHERE ID_ALMACEN = p_id_almacen;

    RETURN v_cantidad;
END;
/

CREATE OR REPLACE FUNCTION obtener_nombre_proveedor_por_compra_fun(
    p_id_compra IN INT
)
RETURN VARCHAR2
IS
    v_nombre_proveedor VARCHAR2(100);
BEGIN
    SELECT pr.NOMBRE INTO v_nombre_proveedor
    FROM PROVEEDORES pr
    JOIN COMPRAS c ON pr.ID_PROVEEDOR = c.ID_PROVEEDOR
    WHERE c.ID_COMPRA = p_id_compra;

    RETURN v_nombre_proveedor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Proveedor no encontrado';
    WHEN OTHERS THEN
        RETURN 'Error';
END;
/

CREATE OR REPLACE FUNCTION obtener_total_cantidad_materiales_detalle_compras_fun(
    p_id_compra IN INT
)
RETURN NUMBER
IS
    v_total_cantidad NUMBER;
BEGIN
    SELECT SUM(CANTIDAD) INTO v_total_cantidad
    FROM DETALLE_COMPRAS
    WHERE ID_COMPRA = p_id_compra;

    RETURN v_total_cantidad;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; -- No se encontraron materiales
    WHEN OTHERS THEN
        RETURN -1; -- Error
END;
/

CREATE OR REPLACE FUNCTION obtener_descripcion_permiso_por_rol_fun(
    p_id_rol IN INT
)
RETURN VARCHAR2
IS
    v_descripcion_permiso VARCHAR2(200);
BEGIN
    SELECT pe.DESCRIPCION INTO v_descripcion_permiso
    FROM PERMISOS pe
    WHERE pe.ID_ROL = p_id_rol;

    RETURN v_descripcion_permiso;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Permiso no encontrado';
    WHEN OTHERS THEN
        RETURN 'Error';
END;
/

CREATE OR REPLACE FUNCTION verifica_existencia_usuario_fun(
    p_username IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_resultado VARCHAR2(10);
BEGIN
    SELECT 'true' INTO v_resultado
    FROM USUARIOS
    WHERE USERNAME = p_username;

    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'false';
    WHEN OTHERS THEN
        RETURN 'error';
END;
/

CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_usuario_departamento_fun(
    p_id_usuario IN INT,
    p_id_departamento IN INT
)
RETURN NUMBER
IS
    v_cantidad NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cantidad
    FROM EQUIPOS e
    JOIN DESPACHOS d ON e.ID_EQUIPO = d.ID_EQUIPO
    JOIN USUARIOS u ON d.ID_PERSONAL = u.ID_PERSONAL
    WHERE u.ID_USUARIOS = p_id_usuario AND d.ID_DEPARTAMENTO = p_id_departamento;

    RETURN v_cantidad;
END;
/

CREATE OR REPLACE FUNCTION obtener_cantidad_roles_usuario_fun(
    p_id_usuario IN INT
)
RETURN NUMBER
IS
    v_cantidad NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cantidad
    FROM ROLES r
    JOIN USUARIOS u ON r.ID_ROL = u.ID_ROL
    WHERE u.ID_USUARIOS = p_id_usuario;

    RETURN v_cantidad;
END;
/

