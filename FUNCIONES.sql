--obtener la cantidad de equipos disponibles
CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_disponibles
RETURN INT
AS
  v_cantidad_equipos INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_equipos
  FROM equipos
  WHERE cantidad_disponible > 0;
  RETURN v_cantidad_equipos;
END;
/

--obtener la cantidad de departamentos
CREATE OR REPLACE FUNCTION obtener_cantidad_departamentos
RETURN INT
AS
  v_cantidad_departamentos INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_departamentos
  FROM departamentos;
  RETURN v_cantidad_departamentos;
END;
/

--obtener la cantidad total de roles de usuario
CREATE OR REPLACE FUNCTION obtener_rol_usuario(
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


--obtener la cantidad de proveedores con nombre en cadena
CREATE OR REPLACE FUNCTION obtener_cantidad_proveedores_por_nombre(
  nombre_proveedor IN VARCHAR2
)
RETURN INT
AS
  v_cantidad_proveedores INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_proveedores
  FROM proveedores
  WHERE nombre LIKE '%' || nombre_proveedor || '%';
  RETURN v_cantidad_proveedores;
END;
/

--obtener la cantidad de recepciones en una fecha especifica
CREATE OR REPLACE FUNCTION obtener_cantidad_recepciones_por_fecha(
  fecha_recepcion IN DATE
)
RETURN INT
AS
  v_cantidad_recepciones INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_recepciones
  FROM recepciones
  WHERE fecha = fecha_recepcion;
  RETURN v_cantidad_recepciones;
END;

-- obtener la cantidad total de equipos por categoria
CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_por_categoria(
  categoria_id IN INT
)
RETURN INT
AS
  v_cantidad_equipos INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_equipos
  FROM equipos
  WHERE categoria = categoria_id;
  RETURN v_cantidad_equipos;
END;
/

--Eliminar Categoria
CREATE OR REPLACE FUNCTION eliminar_categoria (id_categoria IN INT) 
RETURN VARCHAR2 
IS 
BEGIN 
    DELETE FROM categorias 
    WHERE id_categoria = id_categoria;
    COMMIT;
    
    RETURN 'Categoría eliminada exitosamente.';
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RETURN 'Error al eliminar la categoría: ' || SQLERRM;
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
