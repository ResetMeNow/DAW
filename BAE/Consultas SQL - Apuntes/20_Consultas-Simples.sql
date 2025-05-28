-- Consultas sobre una tabla

-- 1.Listar todas las ventas ordenadas por fecha (más recientes primero):

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
sqlite> select * from venta order by fecha DESC;
```sql

```

-- 2. Top 3 ventas de mayor valor:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
sqlite> select * from venta order by total DESC limit 3;
```sql

```

-- 3.Clientes con puntos de fidelidad no nulos:

```sql
+----------+-----------+
|  nombre  | apellido1 |
+----------+-----------+
```
select * from cliente where puntos_fidelidad IS NOT NULL;
```sql

```

-- 4. Ventas del año 2023 con total superior a 1000€:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
 select * from venta where fecha between '2023-01-01'and '2023-12-31' and total >=1000;
```sql

```

-- 5. Empleados con comisión mayor a 0.10:

```sql
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
```
sqlite> select * from empleado where comision > 0.10;
```sql

```

-- 6. Clientes de Madrid o Barcelona:

```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```
sqlite> select * from cliente where ciudad in ('Madrid','Barcelona');
```sql

```