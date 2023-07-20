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
CREATE OR REPLACE FUNCTION obtener_cantidad_roles_usuario
RETURN INT
AS
  v_cantidad_roles INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_roles
  FROM roles;
  RETURN v_cantidad_roles;
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
/

--obtener la cantidad de usuarios en un departamento especifico

--obtener la cantidad de categorias de productos

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

--obtener el salario maximo de todos los empleados

--obtener la cantidad total de empleados

--obtener la cantidad de equipos recibidos en una fecha y departamento específicos

--obtener la cantidad total de empleados por departamento

--obtener la cantidad de empleados con salarios mayores o iguales
