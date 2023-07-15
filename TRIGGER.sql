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
