--Procedimientos PROCEDURE

--PROCEDIMIENTO OBTIENE TODOS LOS EQUIPOS DISPONIBLES
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

--Procedimiento para obtener la lista de departamentos 
CREATE OR REPLACE PROCEDURE obtener_departamentos(
    departamentos_cursor OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN departamentos_cursor FOR
    SELECT *
    FROM departamentos;
END;

--Procedimiento para obtener los roles de usuario
CREATE OR REPLACE PROCEDURE obtener_roles(
    roles_cursor OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN roles_cursor FOR
    SELECT *
    FROM roles;
END;

--Procedimiento para obtener los proveedores por nombre
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

--Procedimiento para obtener las recepciones por fecha
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

