-- TABLA EQUIPOS
CREATE OR REPLACE TRIGGER equipos_trigger
BEFORE INSERT ON equipos
FOR EACH ROW
BEGIN

-- Valor de CANTIDAD_DISPONIBLE a 0 si es negativo
IF :NEW.CANTIDAD_DISPONIBLE < 0 THEN
:NEW.CANTIDAD_DISPONIBLE := 0;
END IF;
END;

-- TABLA ALMACENES
CREATE OR REPLACE TRIGGER almacenes_trigger
BEFORE INSERT ON almacenes
FOR EACH ROW
BEGIN

-- Valor de NOMBRE_ALMACEN a 'Almacén sin nombre' si es NULL
IF :NEW.NOMBRE_ALMACEN IS NULL THEN
:NEW.NOMBRE_ALMACEN := 'Almacén sin nombre';
END IF;
END;

-- Tabla RECEPCIONES 
CREATE OR REPLACE TRIGGER recepciones_trigger
BEFORE INSERT ON recepciones
FOR EACH ROW
BEGIN

-- HORA a CURRENT_TIMESTAMP timestamp si es NULL
IF :NEW.HORA IS NULL THEN
:NEW.HORA := CURRENT_TIMESTAMP;
END IF;
END;

--TABLA PERSONAL
--https://chartio.com/resources/tutorials/how-to-define-an-auto-increment-primary-key-in-oracle/
CREATE OR REPLACE TRIGGER personal_trigger
BEFORE INSERT ON personal
FOR EACH ROW
BEGIN
  SELECT personal_seq.nextval
  INTO :new.ID_PERSONAL
  FROM dual;
END;
--FOR EACH ROW
--BEGIN
--    IF :NEW.TELEFONO IS NULL THEN
--        :NEW.TELEFONO := 'Sin teléfono';
--    END IF;
--END; 

--TABLA PROVEEDORES
CREATE OR REPLACE TRIGGER proveedores_trigger
BEFORE INSERT ON proveedores
FOR EACH ROW
BEGIN
    -- Cambiar CORREO a 'N/A' si es NULL
    IF :NEW.CORREO IS NULL THEN
        :NEW.CORREO := 'N/A';
    END IF;
END;

-- "CATEGORÍAS"
CREATE OR REPLACE TRIGGER categorias_trigger
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
  SELECT categorias_seq.nextval
  INTO :new.ID_CATEGORIA
  FROM dual;
END;
/

-- "ROLES"
CREATE OR REPLACE TRIGGER roles_trigger
BEFORE INSERT ON roles
FOR EACH ROW
BEGIN
  SELECT roles_seq.nextval
  INTO :new.ID_ROL
  FROM dual;
END;
/

-- "PERMISOS"
CREATE OR REPLACE TRIGGER permisos_trigger
BEFORE INSERT ON permisos
FOR EACH ROW
BEGIN
  SELECT permisos_seq.nextval
  INTO :new.ID_PERMISOS
  FROM dual;
END;
/

-- "PROVEEDORES"
CREATE OR REPLACE TRIGGER proveedores_trigger
BEFORE INSERT ON proveedores
FOR EACH ROW
BEGIN
  SELECT proveedores_seq.nextval
  INTO :new.ID_PROVEEDOR
  FROM dual;
END;
/

-- "ALMACENES"
CREATE OR REPLACE TRIGGER almacenes_trigger
BEFORE INSERT ON almacenes
FOR EACH ROW
BEGIN
  SELECT almacenes_seq.nextval
  INTO :new.ID_ALMACEN
  FROM dual;
END;
/

-- "EQUIPOS"
CREATE OR REPLACE TRIGGER equipos_trigger
BEFORE INSERT ON equipos
FOR EACH ROW
BEGIN
  SELECT equipos_seq.nextval
  INTO :new.ID_EQUIPO
  FROM dual;
END;
/

-- "DEPARTAMENTOS"
CREATE OR REPLACE TRIGGER departamentos_trigger
BEFORE INSERT ON departamentos
FOR EACH ROW
BEGIN
  SELECT departamentos_seq.nextval
  INTO :new.ID_DEPARTAMENTO
  FROM dual;
END;
/

-- "PERSONAL"
CREATE OR REPLACE TRIGGER personal_trigger
BEFORE INSERT ON personal
FOR EACH ROW
BEGIN
  SELECT personal_seq.nextval
  INTO :new.ID_PERSONAL
  FROM dual;
END;
/

-- "RECEPCIONES"
CREATE OR REPLACE TRIGGER recepciones_trigger
BEFORE INSERT ON recepciones
FOR EACH ROW
BEGIN
  SELECT recepciones_seq.nextval
  INTO :new.ID_RECEPCION
  FROM dual;
END;
/

-- "DESPACHOS"
CREATE OR REPLACE TRIGGER despachos_trigger
BEFORE INSERT ON despachos
FOR EACH ROW
BEGIN
  SELECT despachos_seq.nextval
  INTO :new.ID_DESPACHO
  FROM dual;
END;
/

-- "USUARIOS"
CREATE OR REPLACE TRIGGER usuarios_trigger
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
  SELECT usuarios_seq.nextval
  INTO :new.ID_USUARIOS
  FROM dual;
END;
/

-- "COMPRAS"
CREATE OR REPLACE TRIGGER compras_trigger
BEFORE INSERT ON compras
FOR EACH ROW
BEGIN
  SELECT compras_seq.nextval
  INTO :new.ID_COMPRA
  FROM dual;
END;
/

-- "DETALLE_COMPRAS"
CREATE OR REPLACE TRIGGER detalle_compras_trigger
BEFORE INSERT ON detalle_compras
FOR EACH ROW
BEGIN
  SELECT detalle_compras_seq.nextval
  INTO :new.ID_DETALLE_COMPRA
  FROM dual;
END;
/

