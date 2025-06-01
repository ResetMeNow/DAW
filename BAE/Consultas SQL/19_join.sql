--INNER JOIN
-- 13. Ventas con nombres de clientes ,empleados y total de ventas (CON UN TIPO DE JOIN):
SELECT 
v.id,
c.nombre AS cliente,
e.nombre AS empleado,
v.total
FROM venta v
INNER JOIN cliente c ON v.id_cliente = c.id
INNER JOIN empleado e  ON v.id_empleado = e.id;
+----+---------+-----------+---------+
| id | cliente | empleado  |  total  |
+----+---------+-----------+---------+
| 1  | David   | María     | 899.99  |
| 2  | Carlos  | Alejandro | 1499.5  |
| 3  | Ana     | Daniel    | 450.75  |
| 4  | Javier  | Pablo     | 299.9   |
| 5  | David   | María     | 1799.0  |
| 6  | Sofía   | Daniel    | 3299.99 |
| 7  | Ana     | Daniel    | 5999.0  |
| 8  | Elena   | Isabel    | 1299.95 |
| 9  | Javier  | Pablo     | 2499.5  |
| 10 | Javier  | María     | 350.25  |
| 11 | Miguel  | Francisco | 199.99  |
| 12 | Ana     | Daniel    | 4199.0  |
| 13 | Laura   | Daniel    | 799.5   |
| 14 | Laura   | Daniel    | 249.9   |
| 15 | Carlos  | Alejandro | 899.0   |
| 16 | Carlos  | Alejandro | 2799.99 |
+----+---------+-----------+---------+



-- 14.  Clientes que compraron en 2023 (CON UN TIPO DE JOIN):
SELECT DISTINCT
c.nombre,
c.apellido1
FROM venta v
INNER JOIN cliente c 
ON  v.id_cliente = c.id
WHERE v.fecha LIKE '2023%';

--JOIN
-- 15.  Empleados que atendieron a clientes de Madrid:

SELECT DISTINCT
e.nombre,
e.apellido1
FROM venta v
JOIN empleado e ON v.id_empleado = e.id
JOIN cliente c ON v.id_cliente = c.id
WHERE c.ciudad = 'Madrid';
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
| María     | Castro    |
| Alejandro | Suárez    |
+-----------+-----------+

-- 16. Ventas superiores a 2000€ con datos de clientes:
 SELECT
 v.id,
 v.total,
 v.fecha,
 v.id_cliente,
 v.id_empleado,
 c.nombre,
 c.apellido1
 FROM venta v
 INNER JOIN cliente c ON v.id_cliente = c.id
 WHERE v.total > 2000;

-- 17. Promedio de ventas por empleado (COUN TIPO DE JOIN):
SELECT 
 e.nombre,
 AVG(v.total) AS 'promedio_ventas'
 FROM empleado e
 LEFT JOIN venta v ON v.id_empleado = e.id
 GROUP BY e.nombre;
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
| Alejandro | 1732.83          |
| Cristina  |                  |
| Daniel    | 2499.69          |
| Francisco | 199.99           |
| Isabel    | 1299.95          |
| Lucía     |                  |
| María     | 1016.41333333333 |
| Pablo     | 1399.7           |
+-----------+------------------+

-- 18. Clientes que no han comprado (CON UN TIPO DE JOIN):

SELECT
c.id,
c.nombre,
c.apellido1,
c.apellido2,
c.ciudad,
c.puntos_fidelidad
FROM cliente c
LEFT JOIN venta v ON v.id_cliente = c.id
WHERE v.id IS NULL;
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
| 9  | Patricia | Romero    | González  | Barcelona | 1100             |
| 10 | Antonio  | Navarro   | Torres    | Valencia  | 400              |
+----+----------+-----------+-----------+-----------+------------------+

--INNER JOIN
--Devuelve sólo las filas que tienen coincidencia en ambas tablas.
SELECT * 
  FROM A 
INNER JOIN B 
  ON A.clave = B.clave;
--Sólo A∩B.

--LEFT JOIN (o LEFT OUTER JOIN)
--Devuelve todas las filas de la tabla de la izquierda (A), y las de la derecha (B) cuando coinciden; si no coinciden, muestra NULL en las columnas de B.
SELECT * 
  FROM A 
LEFT JOIN B 
  ON A.clave = B.clave;
--→ A ∪ (A∩B).

/*CROSS JOIN
Producto cartesiano: cada fila de A combinada con cada fila de B.*/
SELECT * 
  FROM A 
CROSS JOIN B;
