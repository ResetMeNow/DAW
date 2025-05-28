
-- NOT nos elimina de la vista los elementos que no cumplan el criterio
-- Todas las ventas que no sean de 2023
SELECT fecha
FROM venta
WHERE fecha NOT LIKE '2023%';

--OR NOT o la fecha no es 2023 o el total no es mayor a 1000
SELECT fecha, total
FROM venta
WHERE fecha NOT LIKE '2023%' OR total >1000;




--NULL nos muestra los datos que no contienen cierto criterio, sin puntos de fidelidad.
SELECT id, nombre, apellido1 
FROM empleado
WHERE puntos_fidelidad IS NULL;

--Con puntos de fidelidad
SELECT nombre, apellido1
FROM cliente
WHERE puntos_fidelidad IS NOT NULL;





