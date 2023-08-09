-- Procedimiento para verificar el inicio de sesi�n
CREATE OR REPLACE PROCEDURE verifica_login_prc(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    o_result OUT VARCHAR2
)
AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM usuarios
    WHERE username = p_username AND password = p_password;

    IF v_count > 0 THEN
        o_result := 'VALID';
    ELSE
        o_result := 'INVALID';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        o_result := 'INVALID';
END verifica_login_prc;
/

-- Creaci�n del paquete para la gesti�n de inicio de sesi�n
CREATE OR REPLACE PACKAGE LoginPackage AS
    PROCEDURE verifica_login_prc(p_username IN VARCHAR2, p_password IN VARCHAR2, o_result OUT VARCHAR2);
    -- Otros procedimientos relacionados con el inicio de sesi�n podr�an ir aqu�
END LoginPackage;
/

-- Creaci�n del paquete body para la gesti�n de inicio de sesi�n
CREATE OR REPLACE PACKAGE BODY LoginPackage AS
    PROCEDURE verifica_login_prc(p_username IN VARCHAR2, p_password IN VARCHAR2, o_result OUT VARCHAR2) AS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM usuarios
        WHERE username = p_username AND password = p_password;

        IF v_count > 0 THEN
            o_result := 'VALID';
        ELSE
            o_result := 'INVALID';
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            o_result := 'INVALID';
    END verifica_login_prc;

    -- Otros procedimientos relacionados con el inicio de sesi�n podr�an ir aqu�
END LoginPackage;
/
