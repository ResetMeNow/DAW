-- Consultas sobre una tabla

-- 1.Listar todas las ventas ordenadas por fecha (más recientes primero):

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM venta ORDER BY fecha DESC;
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
| 1  | 899.99  | 2023-05-15 | 5          | 2           |
| 3  | 450.75  | 2023-05-15 | 2          | 1           |
| 5  | 1799.0  | 2023-04-22 | 5          | 2           |
| 8  | 1299.95 | 2023-03-18 | 4          | 6           |
| 15 | 899.0   | 2023-03-10 | 1          | 5           |
| 16 | 2799.99 | 2023-03-10 | 1          | 5           |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           |
| 14 | 249.9   | 2023-02-02 | 6          | 1           |
| 13 | 799.5   | 2023-01-25 | 6          | 1           |
| 9  | 2499.5  | 2022-10-15 | 8          | 3           |
| 2  | 1499.5  | 2022-09-20 | 1          | 5           |
| 4  | 299.9   | 2022-08-10 | 8          | 3           |
| 11 | 199.99  | 2022-08-10 | 3          | 7           |
| 6  | 3299.99 | 2022-07-05 | 7          | 1           |
| 7  | 5999.0  | 2021-09-12 | 2          | 1           |
| 10 | 350.25  | 2021-06-30 | 8          | 2           |
+----+---------+------------+------------+-------------+

-- 2. Top 3 ventas de mayor valor:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
SELECT * FROM venta ORDER BY total DESC limit 3;
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
| 7  | 5999.0  | 2021-09-12 | 2          | 1           |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           |
| 6  | 3299.99 | 2022-07-05 | 7          | 1           |
+----+---------+------------+------------+-------------+


-- 3.Clientes con puntos de fidelidad no nulos:

```sql
+----------+-----------+
|  nombre  | apellido1 |
+----------+-----------+
```
SELECT nombre, apellido1 FROM cliente WHERE puntos_fidelidad IS NOT NULL;
+----------+-----------+
|  nombre  | apellido1 |
+----------+-----------+
| Carlos   | Martínez  |
| Ana      | López     |
| Elena    | Gómez     |
| David    | Pérez     |
| Laura    | Jiménez   |
| Sofía    | Hernández |
| Javier   | Domingo   |
| Patricia | Romero    |
| Antonio  | Navarro   |
+----------+-----------+

-- 4. Ventas del año 2023 con total superior a 1000€:

SELECT * FROM venta WHERE fecha LIKE '2023%' AND total >1000;
```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
| 5  | 1799.0  | 2023-04-22 | 5          | 2           |
| 8  | 1299.95 | 2023-03-18 | 4          | 6           |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           |
| 16 | 2799.99 | 2023-03-10 | 1          | 5           |
+----+---------+------------+------------+-------------+

-- 5. Empleados con comisión mayor a 0.10:
```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
/*COMENTARIO . Lucía con id 4 no aparece en tabla venta porque no ha realizado ventas
sin embargo, tiene 0.11 de comision*/
SELECT v.*
FROM venta v, empleado e
WHERE v.id_empleado = e.id
AND e.comision >0.10 GROUP BY e.id;
+----+--------+------------+------------+-------------+
| id | total  |   fecha    | id_cliente | id_empleado |
+----+--------+------------+------------+-------------+
| 3  | 450.75 | 2023-05-15 | 2          | 1           |
+----+--------+------------+------------+-------------+

SELECT * FROM empleado WHERE comision >0.10;
+----+--------+-----------+-----------+----------+
| id | nombre | apellido1 | apellido2 | comision |
+----+--------+-----------+-----------+----------+
| 1  | Daniel | Vázquez   | Gil       | 0.12     |
| 4  | Lucía  | Reyes     | Martín    | 0.11     |
+----+--------+-----------+-----------+----------+


-- 6. Clientes de Madrid o Barcelona:

SELECT * FROM cliente WHERE ciudad IN ('Madrid', 'Barcelona');
```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
| 1  | Carlos   | Martínez  | García    | Madrid    | 1500             |
| 2  | Ana      | López     | Fernández | Barcelona | 800              |
| 5  | David    | Pérez     | Ruiz      | Madrid    | 750              |
| 9  | Patricia | Romero    | González  | Barcelona | 1100             |
+----+----------+-----------+-----------+-----------+------------------+