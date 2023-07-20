--Función para obtener la cantidad de equipos disponibles
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

--Función para obtener la cantidad de departamentos
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

--Función para obtener el promedio del salario de todos los empleados
CREATE OR REPLACE FUNCTION obtener_promedio_salario_empleados
RETURN DECIMAL
AS
  v_promedio_salario DECIMAL;
BEGIN
  SELECT AVG(salario)
  INTO v_promedio_salario
  FROM empleados;
  RETURN v_promedio_salario;
END;
/

--Función para obtener la cantidad total de roles de usuario
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

--Función para obtener la cantidad de proveedores con nombre en cadena
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

--Función para obtener la cantidad de recepciones en una fecha específica
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

--Función para obtener la cantidad de usuarios en un departamento específico
CREATE OR REPLACE FUNCTION obtener_cantidad_usuarios_por_departamento(
  departamento_id IN INT
)
RETURN INT
AS
  v_cantidad_usuarios INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_usuarios
  FROM usuarios
  WHERE id_departamento = departamento_id;
  RETURN v_cantidad_usuarios;
END;
/

--Función para obtener la cantidad de categorías de productos
CREATE OR REPLACE FUNCTION obtener_cantidad_categorias_productos
RETURN INT
AS
  v_cantidad_categorias INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_categorias
  FROM product_categories;
  RETURN v_cantidad_categorias;
END;
/

--Función para obtener la cantidad total de equipos por categoría
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

--Función para obtener el salario máximo de todos los empleados
CREATE OR REPLACE FUNCTION obtener_salario_maximo
RETURN DECIMAL
AS
  v_salario_maximo DECIMAL;
BEGIN
  SELECT MAX(salario)
  INTO v_salario_maximo
  FROM empleados;
  RETURN v_salario_maximo;
END;
/

--Función para obtener la cantidad total de empleados
CREATE OR REPLACE FUNCTION obtener_cantidad_empleados
RETURN INT
AS
  v_cantidad_empleados INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_empleados
  FROM empleados;
  RETURN v_cantidad_empleados;
END;
/

--Función para obtener la cantidad de equipos recibidos en una fecha y departamento específicos
CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_recibidos(
  fecha_recepcion IN DATE,
  departamento_id IN INT
)
RETURN INT
AS
  v_cantidad_equipos INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_equipos
  FROM equipos e
  INNER JOIN recepciones r ON e.id_equipo = r.id_equipo
  WHERE r.fecha = fecha_recepcion AND r.id_departamento = departamento_id;
  RETURN v_cantidad_equipos;
END;
/

--Función para obtener la cantidad total de empleados por departamento
CREATE OR REPLACE FUNCTION obtener_cantidad_empleados_por_departamento(
  departamento_id IN INT
)
RETURN INT
AS
  v_cantidad_empleados INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_empleados
  FROM empleados
  WHERE id_departamento = departamento_id;
  RETURN v_cantidad_empleados;
END;
/

--Función para obtener la cantidad de empleados con salarios mayores o iguales
CREATE OR REPLACE FUNCTION obtener_cantidad_empleados_salario_mayor_o_igual(
  salario_minimo IN DECIMAL
)
RETURN INT
AS
  v_cantidad_empleados INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_empleados
  FROM empleados
  WHERE salario >= salario_minimo;
  RETURN v_cantidad_empleados;
END;
/

--Función para obtener la cantidad de departamentos por región
CREATE OR REPLACE FUNCTION obtener_cantidad_departamentos_por_region(
  region_id IN INT
)
RETURN INT
AS
  v_cantidad_departamentos INT;
BEGIN
  SELECT COUNT(*)
  INTO v_cantidad_departamentos
  FROM departamentos
  WHERE id_region = region_id;
  RETURN v_cantidad_departamentos;
END;
/
