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