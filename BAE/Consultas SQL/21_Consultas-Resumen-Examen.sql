--Aquí aplicaremos todo lo aprendido
-- 4. Consultas resumen (6 consultas - 2.4 puntos / 0.4 cada una)


-- 19. Total de ventas por ciudad de cliente:
SELECT 
c.ciudad,
v.total AS 'total_ventas'
FROM venta v, cliente c
WHERE v.id_cliente = c.id
GROUP BY c.ciudad;
+-----------+--------------+
|  ciudad   | total_ventas |
+-----------+--------------+
| Barcelona | 450.75       |
| Bilbao    | 799.5        |
| Madrid    | 899.99       |
| Málaga    | 299.9        |
| Sevilla   | 1299.95      |
| Valencia  | 199.99       |
| Zaragoza  | 3299.99      |
+-----------+--------------+



-- 20. Número de ventas por empleado en 2023:

SELECT 
e.nombre,
COUNT(*) AS 'num_ventas'
FROM venta v, empleado e
WHERE v.id_empleado = e.id AND v.fecha LIKE '2023%'
GROUP BY e.nombre;
+-----------+------------+
|  nombre   | num_ventas |
+-----------+------------+
| Alejandro | 2          |
| Daniel    | 4          |
| Isabel    | 1          |
| María     | 2          |
+-----------+------------+


-- 21. Promedio de puntos de fidelidad por ciudad:
SELECT 
ciudad,
AVG(puntos_fidelidad) AS 'puntos_promedio'
FROM cliente
GROUP BY ciudad; 
+-----------+-----------------+
|  ciudad   | puntos_promedio |
+-----------+-----------------+
| Barcelona | 950.0           |
| Bilbao    | 950.0           |
| Madrid    | 1125.0          |
| Málaga    | 600.0           |
| Sevilla   | 1200.0          |
| Valencia  | 400.0           |
| Zaragoza  | 1800.0          |
+-----------+-----------------+

-- 22. Máxima venta por año:
SELECT 
fecha AS 'año',
MAX(total) AS 'num_compras'
FROM venta
GROUP BY fecha;
+------------+-------------+
|    año     | num_compras |
+------------+-------------+
| 2021-06-30 | 350.25      |
| 2021-09-12 | 5999.0      |
| 2022-07-05 | 3299.99     |
| 2022-08-10 | 299.9       |
| 2022-09-20 | 1499.5      |
| 2022-10-15 | 2499.5      |
| 2023-01-25 | 799.5       |
| 2023-02-02 | 249.9       |
| 2023-02-14 | 4199.0      |
| 2023-03-10 | 2799.99     |
| 2023-03-18 | 1299.95     |
| 2023-04-22 | 1799.0      |
| 2023-05-15 | 899.99      |
+------------+-------------+

-- 23. Clientes con más de 1 compra:
SELECT 
c.nombre
COUNT(v.id) AS 'num_compras'
FROM venta v, cliente c
WHERE v.id_cliente = c.id
GROUP BY c.nombre
HAVING COUNT (v.id) >1;
+--------+-------------+
| nombre | num_compras |
+--------+-------------+
| Ana    | 3           |
| Carlos | 3           |
| David  | 2           |
| Javier | 3           |
| Laura  | 2           |
+--------+-------------+

-- 24. Empleados con ventas promedio superiores a 1000€:

SELECT
e.nombre,
AVG(v.total) AS venta_promedio
FROM venta v, empleado e
WHERE v.id_empleado = e.id
GROUP BY e.nombre
HAVING AVG(v.total) >1000;
+-----------+------------------+
|  nombre   |  venta_promedio  |
+-----------+------------------+
| Alejandro | 1732.83          |
| Daniel    | 2499.69          |
| Isabel    | 1299.95          |
| María     | 1016.41333333333 |
| Pablo     | 1399.7           |
+-----------+------------------+
