-- Obtener el salario máximo de todos los empleados
CREATE OR REPLACE FUNCTION obtener_salario_maximo()
RETURN DECIMAL(10, 2)
AS
    v_max_salary DECIMAL(10, 2);
BEGIN
    SELECT MAX(SALARIO) INTO v_max_salary FROM EMPLEADOS;
    RETURN v_max_salary;
END;
/

-- Obtener la cantidad total de empleados
CREATE OR REPLACE FUNCTION obtener_cantidad_total_empleados()
RETURN INT
AS
    v_total_empleados INT;
BEGIN
    SELECT COUNT(*) INTO v_total_empleados FROM EMPLEADOS;
    RETURN v_total_empleados;
END;
/

-- Obtener la cantidad de equipos recibidos en una fecha y departamento específicos
CREATE OR REPLACE FUNCTION obtener_cantidad_equipos_recibidos_por_fecha_y_departamento(
  fecha_recepcion IN DATE,
  departamento_id IN INT
)
RETURN INT
AS
    v_cantidad_equipos INT;
BEGIN
    SELECT COUNT(*) INTO v_cantidad_equipos
    FROM RECEPCIONES
    WHERE FECHA = fecha_recepcion AND ID_DEPARTAMENTO = departamento_id;
    RETURN v_cantidad_equipos;
END;
/

-- Obtener la cantidad total de empleados por departamento
CREATE OR REPLACE FUNCTION obtener_cantidad_empleados_por_departamento(
  departamento_id IN INT
)
RETURN INT
AS
    v_cantidad_empleados INT;
BEGIN
    SELECT COUNT(*) INTO v_cantidad_empleados
    FROM EMPLEADOS
    WHERE ID_DEPARTAMENTO = departamento_id;
    RETURN v_cantidad_empleados;
END;
/

-- Obtener la cantidad de empleados con salarios mayores o iguales
CREATE OR REPLACE FUNCTION obtener_cantidad_empleados_salario_mayor_o_igual(
  salario_minimo IN DECIMAL(10, 2)
)
RETURN INT
AS
    v_cantidad_empleados INT;
BEGIN
    SELECT COUNT(*) INTO v_cantidad_empleados
    FROM EMPLEADOS
    WHERE SALARIO >= salario_minimo;
    RETURN v_cantidad_empleados;
END;
/
