-- 2. Consultas multitabla (WHERE) (6 consultas - 1.8 puntos / 0.3 cada una)

-- 7. Ventas con nombres de clientes ,empleados y total de ventas (sin JOIN):

```sql
+----+---------+-----------+---------+
| id | cliente | empleado  |  total  |
+----+---------+-----------+---------+
```

SELECT 
v.id,
c.nombre AS 'cliente',
e.nombre AS 'empleado',
v.total
FROM venta v, cliente c, empleado e
WHERE v.id_cliente = c.id
AND v.id_empleado = e.id;
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

-- 8.  Clientes que compraron en 2023 (sin JOIN):

```sql
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
```
SELECT nombre, apellido1
FROM cliente c, venta v
WHERE c.id = v.id_cliente
AND fecha LIKE '2023%';
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
| David  | Pérez     |
| Ana    | López     |
| David  | Pérez     |
| Elena  | Gómez     |
| Ana    | López     |
| Laura  | Jiménez   |
| Laura  | Jiménez   |
| Carlos | Martínez  |
| Carlos | Martínez  |
+--------+-----------+

-- 9.  Empleados que atendieron a clientes de Madrid:

```sql
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
```
SELECT DISTINCT
e.nombre,
e.apellido1
FROM venta v, cliente c, empleado e
WHERE  v.id_empleado = e.id
AND v.id_cliente = c.id
AND c.ciudad IN ('Madrid');
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
| María     | Castro    |
| Alejandro | Suárez    |
+-----------+-----------+

-- 10. Ventas superiores a 2000€ con datos de clientes:

```sql
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
```
SELECT v.*,
c.nombre,
c.apellido1
FROM venta v, cliente c
WHERE v.id_cliente = c.id
AND v.total > 2000;
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
| 6  | 3299.99 | 2022-07-05 | 7          | 1           | Sofía  | Hernández |
| 7  | 5999.0  | 2021-09-12 | 2          | 1           | Ana    | López     |
| 9  | 2499.5  | 2022-10-15 | 8          | 3           | Javier | Domingo   |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           | Ana    | López     |
| 16 | 2799.99 | 2023-03-10 | 1          | 5           | Carlos | Martínez  |
+----+---------+------------+------------+-------------+--------+-----------+

-- 11. Promedio de ventas por empleado (sin JOIN):

```sql
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
```
SELECT 
e.nombre,
AVG(v.total) AS 'promedio_ventas'
FROM empleado e, venta v
WHERE v.id_empleado = e.id
GROUP BY e.nombre;
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
| Alejandro | 1732.83          |
| Daniel    | 2499.69          |
| Francisco | 199.99           |
| Isabel    | 1299.95          |
| María     | 1016.41333333333 |
| Pablo     | 1399.7           |
+-----------+------------------+
-- 12. Clientes que no han comprado (sin JOIN):

SELECT *
FROM cliente c
WHERE c.id NOT IN(
    SELECT id_cliente
    FROM venta
);
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
| 9  | Patricia | Romero    | González  | Barcelona | 1100             |
| 10 | Antonio  | Navarro   | Torres    | Valencia  | 400              |
+----+----------+-----------+-----------+-----------+------------------+
```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
