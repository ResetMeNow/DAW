-- LIKE le pedimos un criterio de búsqueda variable

-- EJEMPLO
SELECT id_cliente, id_empleado, fecha
FROM venta
WHERE fecha LIKE '2023%';

/*IMPORTANTE el porcentaje '%' es necesario cuando queremos
excluir el resto de datos y solo queremos uno en concreto, 
en este caso yo solo quiero la fecha de 2023*/



-- Usamos otra vez porcentaje '%' ya que solo quiero las ventas de 2022*/
SELECT total, fecha
FROM venta
WHERE fecha LIKE '2022%' 
ORDER BY fecha DESC;

-- Aquí quiero los id de los clientes que compraron en 2021*/
SELECT id_cliente, fecha
FROM venta
WHERE fecha LIKE '2021%';


-- Preguntas de examen*/
--. Ventas del año 2023 con total superior a 1000€:
SELECT * FROM venta
WHERE fecha LIKE '2023%'
AND total >1000;

--. Top 5 ventas de mayor valor:
SELECT total FROM venta 
ORDER BY total DESC 
limit 5;


--. Clientes que empiezan por la letra A o apellido por G.
SELECT nombre, apellido1, apellido2
FROM cliente
WHERE nombre LIKE 'A%'
OR apellido1 LIKE 'G%'
OR apellido2 LIKE 'G%';


