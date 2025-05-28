--NULL nos muestra los datos que no contienen cierto criterio, sin puntos de fidelidad.
SELECT id, nombre, apellido1 
FROM empleado
WHERE puntos_fidelidad IS NULL;

--Con puntos de fidelidad
SELECT nombre, apellido1
FROM cliente
WHERE puntos_fidelidad IS NOT NULL;


--Personas con apellidos
SELECT nombre, apellido1, apellido2
FROM cliente
WHERE apellido1 OR apellido2 IS NOT NULL;

--Personas sin apellidos
SELECT nombre, apellido1, apellido2
FROM cliente
WHERE apellido1 OR apellido2 IS NULL;