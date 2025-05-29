-- 14.  Clientes que compraron en 2023 (CON UN TIPO DE JOIN):

SELECT c.nombre, c.apellido1
FROM cliente c
INNER JOIN venta v ON v.id_cliente = c.id
AND v.fecha LIKE '2023%';
```sql
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
```
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

-- 15.  Empleados que atendieron a clientes de Madrid:
SELECT DISTINCT e.nombre, e.apellido1
FROM venta v
INNER JOIN cliente c ON v.id_cliente = c.id
INNER JOIN empleado e ON v.id_empleado = e.id
AND c.ciudad = 'Madrid';

```sql
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
```
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
| María     | Castro    |
| Alejandro | Suárez    |
+-----------+-----------+

-- 16. Ventas superiores a 2000€ con datos de clientes:

SELECT v.* , c.nombre, c.apellido1
FROM venta v 
INNER JOIN cliente c ON v.id_cliente = c.id
AND total > 2000;
```sql
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
```
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
| 6  | 3299.99 | 2022-07-05 | 7          | 1           | Sofía  | Hernández |
| 7  | 5999.0  | 2021-09-12 | 2          | 1           | Ana    | López     |
| 9  | 2499.5  | 2022-10-15 | 8          | 3           | Javier | Domingo   |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           | Ana    | López     |
| 16 | 2799.99 | 2023-03-10 | 1          | 5           | Carlos | Martínez  |
+----+---------+------------+------------+-------------+--------+-----------+


-- 17. Promedio de ventas por empleado (COUN TIPO DE JOIN):

SELECT e.nombre,
AVG(v.total) AS 'promedio_ventas'
FROM empleado e
INNER JOIN venta v ON v.id_empleado = e.id
GROUP BY e.id;

```sql
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
```
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
| Daniel    | 2499.69          |
| María     | 1016.41333333333 |
| Pablo     | 1399.7           |
| Alejandro | 1732.83          |
| Isabel    | 1299.95          |
| Francisco | 199.99           |
+-----------+------------------+


-- 18. Clientes que no han comprado (CON UN TIPO DE JOIN):

SELECT c.* 
FROM cliente c
LEFT JOIN venta v ON v.id_cliente = c.id
WHERE v.id IS NULL;
```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
| 9  | Patricia | Romero    | González  | Barcelona | 1100             |
| 10 | Antonio  | Navarro   | Torres    | Valencia  | 400              |
+----+----------+-----------+-----------+-----------+------------------+