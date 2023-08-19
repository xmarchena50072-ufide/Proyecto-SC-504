--JOIN en las vistas

--1. JOIN DE CATEGORIAS ENTRE EQUIPOS

SELECT
    vc."Nombre de categoría",
    ve."Nombre del equipo",
    vp."Nombre de proveedor"
FROM vista_categorias vc
JOIN vista_equipos ve ON vc."Identificador de categoría" = ve."Identificador de categoría"
LEFT JOIN vista_proveedores vp ON ve."Identificador de equipo" = vp."Identificador de proveedor";

--2. JOIN ENTRE EQUIPOS Y RECEPCIONES

SELECT
    ve."Nombre del equipo",
    vr."Fecha de recepción"
FROM vista_equipos ve
JOIN vista_recepciones vr ON ve."Identificador de equipo" = vr."Identificador de equipo";

--3. JOIN ENTRE PERSONAL Y DEPARTAMENTOS

SELECT
    vp."Nombre",
    vd."Nombre del departamento"
FROM vista_personal vp
JOIN vista_departamentos vd ON vp."Identificador de departamento" = vd."Identificador de departamento";

--4. JOIN ENTRE USUARIOS Y ROLES

SELECT
    vu."Nombre de usuario",
    vr."Nombre de rol"
FROM vista_usuarios vu
JOIN vista_roles vr ON vu."Identificador de rol" = vr."Identificador de rol";

--5. JOIN ENTRE COMPRAS Y DETALLE DE COMPRAS 

SELECT
    vc."Fecha de compra",
    vdc."Material",
    vdc."Cantidad"
FROM vista_compras vc
JOIN vista_detalle_compras vdc ON vc."Identificador de compra" = vdc."Identificador de compra";

--6. JOIN ENTRE EQUIPOS, CATEGORIAS Y DEPARTAMENTOS

SELECT
    ve."Nombre del equipo",
    vc."Nombre de categoría",
    vd."Nombre del departamento"
FROM vista_equipos ve
JOIN vista_categorias vc ON ve."Identificador de categoría" = vc."Identificador de categoría"
JOIN vista_departamentos vd ON ve."Identificador de categoría" = vd."Identificador de departamento";

--7. JOIN ENTRE RECEPCIONES, ALMACENES Y PROVEEDORES 

SELECT
    vr."Fecha de recepción",
    va."Nombre de almacén",
    vp."Nombre de proveedor"
FROM vista_recepciones vr
JOIN vista_almacenes va ON vr."Identificador de almacén" = va."Identificador de almacén"
JOIN vista_proveedores vp ON va."Identificador de almacén" = vp."Identificador de proveedor";

--8. JOIN ENTRE EQUIPO, PERSONAL Y DESPACHO

SELECT
    ve."Nombre del equipo",
    vp."Nombre",
    vd."Fecha de despacho"
FROM vista_equipos ve
JOIN vista_despachos vd ON ve."Identificador de equipo" = vd."Identificador de equipo"
JOIN vista_personal vp ON vd."Identificador de personal" = vp."Identificador de personal";

--9 JOIN ENTRE ROLES, PERMISOS Y USUARIOS

SELECT
    vr."Nombre de rol",
    vp."Nombre de permiso",
    vu."Nombre de usuario"
FROM vista_roles vr
JOIN vista_permisos vp ON vr."Identificador de rol" = vp."Identificador de rol"
JOIN vista_usuarios vu ON vp."Identificador de rol" = vu."Identificador de rol";

--10. JOIN ENTRE COMPRA, PROVEEDORES Y DETALLES DE COMPRA

SELECT
    vc."Fecha de compra",
    vp."Nombre de proveedor",
    vdc."Material",
    vdc."Cantidad"
FROM vista_compras vc
JOIN vista_proveedores vp ON vc."Identificador de proveedor" = vp."Identificador de proveedor"
JOIN vista_detalle_compras vdc ON vc."Identificador de compra" = vdc."Identificador de compra";
