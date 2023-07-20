-- "CATEGOR�AS"
COMMENT ON TABLE CATEGORIAS IS 'Tabla que almacena las categor�as de los equipos';
COMMENT ON COLUMN CATEGORIAS.ID_CATEGORIA IS 'Identificador y llave primaria de la categor�a';
COMMENT ON COLUMN CATEGORIAS.NOMBRE_CATEGORIA IS 'Nombre de la categor�a';

--"EQUIPOS"
COMMENT ON TABLE EQUIPOS IS 'Tabla que almacena la informaci�n de los equipos disponibles';
COMMENT ON COLUMN EQUIPOS.ID_EQUIPO IS 'Identificador y llave primaria del equipo';
COMMENT ON COLUMN EQUIPOS.NOMBRE_EQUIPO IS 'Nombre del equipo';
COMMENT ON COLUMN EQUIPOS.DESCRIPCION IS 'Descripci�n del equipo';
COMMENT ON COLUMN EQUIPOS.NUM_SERIE IS 'N�mero de serie del equipo';
COMMENT ON COLUMN EQUIPOS.CANTIDAD_DISPONIBLE IS 'Cantidad disponible del equipo';
COMMENT ON COLUMN EQUIPOS.CATEGORIA IS 'ID de la categor�a del equipo';

-- "DEPARTAMENTOS"
COMMENT ON TABLE DEPARTAMENTOS IS 'Tabla que almacena los departamentos';
COMMENT ON COLUMN DEPARTAMENTOS.ID_DEPARTAMENTO IS 'Identificador y llave primaria del departamento';
COMMENT ON COLUMN DEPARTAMENTOS.NOMBRE_DEPARTAMENTO IS 'Nombre del departamento';

-- "PERSONAL"
COMMENT ON TABLE PERSONAL IS 'Tabla que almacena la informaci�n del personal';
COMMENT ON COLUMN PERSONAL.ID_PERSONAL IS 'Identificador y llave primaria del personal';
COMMENT ON COLUMN PERSONAL.NOMBRE IS 'Nombre del personal';
COMMENT ON COLUMN PERSONAL.TELEFONO IS 'N�mero de tel�fono del personal';
COMMENT ON COLUMN PERSONAL.CORREO IS 'Correo electr�nico del personal';
COMMENT ON COLUMN PERSONAL.ID_DEPARTAMENTO IS 'ID del departamento al que pertenece el personal';

-- "ROLES"
COMMENT ON TABLE ROLES IS 'Tabla que almacena los roles';
COMMENT ON COLUMN ROLES.ID_ROL IS 'Identificador y llave primaria del rol';
COMMENT ON COLUMN ROLES.NOMBRE IS 'Nombre del rol';
COMMENT ON COLUMN ROLES.DESCRIPCION IS 'Descripci�n del rol';

-- "PERMISOS"
COMMENT ON TABLE PERMISOS IS 'Tabla que almacena los permisos';
COMMENT ON COLUMN PERMISOS.ID_PERMISOS IS 'Identificador y llave primaria del permiso';
COMMENT ON COLUMN PERMISOS.NOMBRE IS 'Nombre del permiso';
COMMENT ON COLUMN PERMISOS.ID_ROL IS 'ID del rol al que pertenece el permiso';
COMMENT ON COLUMN PERMISOS.DESCRIPCION IS 'Descripci�n del permiso';

-- Tabla "PROVEEDORES"
COMMENT ON TABLE PROVEEDORES IS 'Tabla que almacena la informaci�n de los proveedores';
COMMENT ON COLUMN PROVEEDORES.ID_PROVEEDOR IS 'Identificador y llave primaria del proveedor';
COMMENT ON COLUMN PROVEEDORES.NOMBRE IS 'Nombre del proveedor';
COMMENT ON COLUMN PROVEEDORES.TELEFONO IS 'N�mero de tel�fono del proveedor';
COMMENT ON COLUMN PROVEEDORES.CORREO IS 'Correo electr�nico del proveedor';

-- "RECEPCIONES"
COMMENT ON TABLE RECEPCIONES IS 'Tabla que almacena las recepciones de equipos';
COMMENT ON COLUMN RECEPCIONES.ID_RECEPCION IS 'Identificador y llave primaria de la recepci�n';
COMMENT ON COLUMN RECEPCIONES.ID_EQUIPO IS 'ID del equipo recibido';
COMMENT ON COLUMN RECEPCIONES.ID_ALMACEN IS 'ID del almac�n que recibi� el equipo';
COMMENT ON COLUMN RECEPCIONES.FECHA IS 'Fecha de la recepci�n del equipo';
COMMENT ON COLUMN RECEPCIONES.HORA IS 'Hora de la recepci�n del equipo';

--"ALMACENES"
COMMENT ON TABLE ALMACENES IS 'Tabla que almacena la informaci�n de los almacenes';
COMMENT ON COLUMN ALMACENES.ID_ALMACEN IS 'Identificador y llave primaria del almac�n';
COMMENT ON COLUMN ALMACENES.ID_RECEPCION IS 'ID de la recepci�n asociada al almac�n';
COMMENT ON COLUMN ALMACENES.ID_EQUIPO IS 'ID del equipo almacenado';
COMMENT ON COLUMN ALMACENES.NOMBRE_ALMACEN IS 'Nombre del almac�n';

-- "DESPACHOS"
COMMENT ON TABLE DESPACHOS IS 'Tabla que almacena la informaci�n de los despachos de equipos';
COMMENT ON COLUMN DESPACHOS.ID_DESPACHO IS 'Identificador �nico del despacho';
COMMENT ON COLUMN DESPACHOS.ID_EQUIPO IS 'ID del equipo despachado';
COMMENT ON COLUMN DESPACHOS.ID_DEPARTAMENTO IS 'ID del departamento al que se despach� el equipo';
COMMENT ON COLUMN DESPACHOS.FECHA IS 'Fecha del despacho del equipo';
COMMENT ON COLUMN DESPACHOS.HORA IS 'Hora del despacho del equipo';
COMMENT ON COLUMN DESPACHOS.ID_PERSONAL IS 'ID del personal que realiz� el despacho';

-- "USUARIOS"
COMMENT ON TABLE USUARIOS IS 'Tabla que almacena la informaci�n de los usuarios';
COMMENT ON COLUMN USUARIOS.ID_USUARIOS IS 'Identificador y llave primaria del usuario';
COMMENT ON COLUMN USUARIOS.ID_PERSONAL IS 'ID del personal asociado al usuario';
COMMENT ON COLUMN USUARIOS.USERNAME IS 'Nombre de usuario';
COMMENT ON COLUMN USUARIOS.PASSWORD IS 'Contrase�a del usuario';
COMMENT ON COLUMN USUARIOS.ID_ROL IS 'ID del rol del usuario';

--"COMPRA"
COMMENT ON TABLE COMPRA IS 'Tabla que almacena la informaci�n de las compras';
COMMENT ON COLUMN COMPRA.ID_COMPRA IS 'Identificador y llave primaria de la compra';
COMMENT ON COLUMN COMPRA.ID_PROVEEDOR IS 'ID del proveedor asociado a la compra';
COMMENT ON COLUMN COMPRA.FECHA_COMPRA IS 'Fecha de la compra';
COMMENT ON COLUMN COMPRA.ID_DETALLE_COMPRA IS 'ID del detalle de la compra asociado';

-- "DETALLE_COMPRA"
COMMENT ON TABLE DETALLE_COMPRA IS 'Tabla que almacena el detalle de las compras';
COMMENT ON COLUMN DETALLE_COMPRA.ID_DETALLE_COMPRA IS 'Identificador y llave primaria del detalle de compra';
COMMENT ON COLUMN DETALLE_COMPRA.MATERIAL IS 'Nombre del material comprado';
COMMENT ON COLUMN DETALLE_COMPRA.CANTIDAD IS 'Cantidad del material comprado';
COMMENT ON COLUMN DETALLE_COMPRA.PRECIO_UNITARIO IS 'Precio unitario del material comprado';
