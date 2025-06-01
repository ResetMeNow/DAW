-- Consultas sobre una tabla

-- 1.Listar todas las ventas ordenadas por fecha (más recientes primero):

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM venta ORDER BY fecha DESC;
```sql

```

-- 2. Top 3 ventas de mayor valor:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM venta ORDER BY total DESC LIMIT 3;
```sql

```

-- 3.Clientes con puntos de fidelidad no nulos:

```sql
+----------+-----------+
|  nombre  | apellido1 |
+----------+-----------+
```
SELECT * FROM cliente WHERE puntos_fidelidad IS NOT NULL;
```sql

```

-- 4. Ventas del año 2023 con total superior a 1000€:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM venta WHERE fecha LIKE '2023%' AND total > 1000;
```sql

```

-- 5. Empleados con comisión mayor a 0.10:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM empleado WHERE comision > 0.10;
```sql

```

-- 6. Clientes de Madrid o Barcelona:

```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
SELECT * FROM cliente WHERE ciudad IN ('Madrid','Barcelona');
```sql

```

-- 2. Consultas multitabla (WHERE) (6 consultas - 1.8 puntos / 0.3 cada una)

-- 7. Ventas con nombres de clientes ,empleados y total de ventas (sin JOIN):

```sql
+----+---------+-----------+---------+
| id | cliente | empleado  |  total  |
+----+---------+-----------+---------+
```
SELECT v.id, c.nombre AS cliente, e.nombre AS empleado, v.total
FROM venta v, cliente c, empleado e
WHERE v.id_cliente = c.id
AND v.id_empleado = e.id;
```sql

```

-- 8.  Clientes que compraron en 2023 (sin JOIN):

```sql
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
```
SELECT DISTINCT c.nombre, c.apellido1
FROM venta v, cliente c
WHERE v.id_cliente = c.id
AND fecha LIKE '2023%';
```sql

```

-- 9.  Empleados que atendieron a clientes de Madrid:

```sql
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
```
SELECT DISTINCT e.nombre, e.apellido1
FROM venta v, cliente c, empleado e
WHERE id_cliente = c.id
AND id_empleado = e.id
AND c.ciudad = 'Madrid';
```sql

```

-- 10. Ventas superiores a 2000€ con datos de clientes:

```sql
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
```
SELECT v.*, c.nombre, c.apellido1
FROM venta v, cliente c
WHERE v.id_cliente = c.id
AND v.total > 2000;
```sql

```

-- 11. Promedio de ventas por empleado (sin JOIN):

```sql
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
```
SELECT e.nombre, AVG(total) AS promedio_ventas
FROM empleado e, venta v
WHERE v.id_empleado = e.id
GROUP BY e.id;
```sql

```

-- 12. Clientes que no han comprado (sin JOIN):

```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```

SELECT * 
FROM cliente 
WHERE id NOt IN(
    SELECT id_cliente FROM venta
);
```sql

```

-- 3. Consultas multitabla (JOIN) (6 consultas - 1.8 puntos / 0.3 cada una)

-- 13. Ventas con nombres de clientes ,empleados y total de ventas (CON UN TIPO DE JOIN):

```sql
+----+---------+-----------+---------+
| id | cliente | empleado  |  total  |
+----+---------+-----------+---------+
```
SELECT v.id, c.nombre AS cliente, e.nombre AS empleado, v.total
FROM venta v
INNER JOIN cliente c ON v.id_cliente = c.id
JOIN empleado e ON v.id_empleado = e.id;
```sql

```

-- 14.  Clientes que compraron en 2023 (CON UN TIPO DE JOIN):

```sql
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
```
SELECT DISTINCT c.nombre, c.apellido1
FROM venta v
JOIN cliente c ON v.id_cliente = c.id
AND fecha LIKE '2023%';
```sql

```

-- 15.  Empleados que atendieron a clientes de Madrid:

```sql
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
```
SELECT DISTINCT e.nombre, e.apellido1
FROM venta v
JOIN cliente c ON id_cliente = c.id
JOIN empleado e ON id_empleado = e.id
AND c.ciudad = 'Madrid';
```sql

```

-- 16. Ventas superiores a 2000€ con datos de clientes:

```sql
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
```
SELECT v.*, c.nombre, c.apellido1
FROM venta v
INNER JOIN cliente c ON v.id_cliente = c.id
AND v.total > 2000;
```sql

```

-- 17. Promedio de ventas por empleado (COUN TIPO DE JOIN):

```sql
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
```
SELECT e.nombre, AVG(total) AS promedio_ventas
FROM venta v
JOIN empleado e ON v.id_empleado = e.id
GROUP BY e.id;
```sql

```

-- 18. Clientes que no han comprado (CON UN TIPO DE JOIN):

```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
SELECT c.*
FROM cliente c
LEFT JOIN venta v ON v.id_cliente = c.id
WHERE v.id_cliente IS NULL;
--LEFT JOIN CUANDO voy a PONER NULL y acuerdate acompañado de WHERE
```sql

```

-- 4. Consultas resumen (6 consultas - 2.4 puntos / 0.4 cada una)

```sql
+-----------+--------------+
|  ciudad   | total_ventas |
+-----------+--------------+
```

-- 19. Total de ventas por ciudad de cliente:

SELECT c.ciudad, AVG(v.total) 
FROM cliente c, venta v 
WHERE v.id_cliente =  c.id 
GROUP BY c.ciudad;
```sql

```

-- 20. Número de ventas por empleado en 2023:

```sql
+-----------+------------+
|  nombre   | num_ventas |
+-----------+------------+
```
SELECT COUNT(total) AS num_ventas , e.nombre AS nombre
FROM venta v, empleado e
WHERE v.id_empleado = e.id
AND v.fecha LIKE '2023%'
GROUP BY e.nombre;

```sql

```

-- 21. Promedio de puntos de fidelidad por ciudad:

```sql
+-----------+-----------------+
|  ciudad   | puntos_promedio |
+-----------+-----------------+
```
SELECT ciudad, AVG(puntos_fidelidad) AS puntos_promedio
FROM cliente 
GROUP BY ciudad;
```sql

```

-- 22. Máxima venta por año:

```sql
+------+-----------+
| año  | max_venta |
+------+-----------+
```

SELECT MAX(total) AS max_venta, fecha AS año
FROM venta 
WHERE fecha LIKE '2023%'

UNION ALL 

SELECT MAX(total) AS max_venta, fecha AS año
FROM venta 
WHERE fecha LIKE '2022%'

UNION ALL 

SELECT MAX(total) AS max_venta, fecha AS año
FROM venta 
WHERE fecha LIKE '2021%';

```sql
-- Repetir para otros años si es necesario.

```

-- 23. Clientes con más de 1 compra:

```sql
+--------+-------------+
| nombre | num_compras |
+--------+-------------+
```
SELECT COUNT(v.id) AS num_compras, c.nombre
FROM venta v, cliente c
WHERE v.id_cliente = c.id
AND v.id > 1
GROUP BY c.nombre;

```sql

```

-- 24. Empleados con ventas promedio superiores a 1000€:

```sql
+-----------+------------------+
|  nombre   |  venta_promedio  |
+-----------+------------------+
```
SELECT e.nombre, AVG(v.total) AS venta_promedio
FROM empleado e, venta v
WHERE v.total > 1000
GROUP BY e.nombre ;
```sql

```

-- 5. Subconsultas (6 consultas - 3.0 puntos / 0.5 cada una)

-- 25. Clientes con ventas superiores al promedio:

```sql
+----+--------+-----------+-----------+-----------+------------------+
| id | nombre | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+--------+-----------+-----------+-----------+------------------+
```
SELECT c.* 
FROM cliente c, venta v
WHERE c.id = v.id_cliente
AND v.total > (
    SELECT AVG(total) FROM venta
);
```sql
```

-- 26. Empleados que no han realizado ventas:

```sql
+----+----------+-----------+-----------+----------+
| id |  nombre  | apellido1 | apellido2 | comision |
+----+----------+-----------+-----------+----------+
```
SELECT *
FROM empleado
WHERE id NOT IN(
    SELECT id_empleado FROM venta
);
```sql

```

-- 27. Ventas de clientes con puntos de fidelidad > 1000:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT *
FROM venta 
WHERE id_cliente IN (
    SELECT id FROM cliente WHERE puntos_fidelidad > 1000
);
```sql

```

-- 28. Clientes con al menos una venta > 2000€:

```sql
+----+--------+-----------+-----------+-----------+------------------+
| id | nombre | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+--------+-----------+-----------+-----------+------------------+
```
SELECT *
FROM cliente
WHERE id IN (
    SELECT id_cliente FROM venta WHERE total > 2000
);
```sql

```

-- 29. Empleados con ventas en todas las ciudades:

SELECT e.*
FROM empleado e
WHERE e.id IN (
  SELECT v.id_empleado
  FROM venta v, cliente c
  WHERE v.id_cliente = c.id
  GROUP BY v.id_empleado
  HAVING COUNT(DISTINCT c.ciudad) = (
    SELECT COUNT(DISTINCT ciudad) FROM cliente
  )
);

```sql

```

-- 30. Ventas del cliente con más puntos de fidelidad:
SELECT *
FROM venta
WHERE id_cliente = (
    SELECT id FROM cliente 
    ORDER BY puntos_fidelidad 
    DESC limit 1
);


```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```

```sql

```

-- . Resumen de Puntos
-- Categoría    N° Consultas    Puntos  Total
-- Consultas sobre una tabla    6   0.2 1.2
-- Multitabla (WHERE)           6   0.3 1.8
-- Multitabla (JOIN)            6   0.3 1.8
-- Consultas resumen            6   0.4 2.4
-- Subconsultas                 6   0.5 3.0
-- Total                        30      10
