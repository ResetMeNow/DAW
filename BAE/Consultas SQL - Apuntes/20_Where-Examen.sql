-- 2. Consultas multitabla (WHERE) (6 consultas - 1.8 puntos / 0.3 cada una)

-- 7. Ventas con nombres de clientes ,empleados y total de ventas (sin JOIN):

```sql
+----+---------+-----------+---------+
| id | cliente | empleado  |  total  |
+----+---------+-----------+---------+
```
sqlite> select v.id, v.total, c.nombre AS clientes, e.nombre AS empleado from venta v, cliente c, empleado e where v.id_cliente = c.id and v.id_empleado = e.id;
```sql

```

-- 8.  Clientes que compraron en 2023 (sin JOIN):

```sql
+--------+-----------+
| nombre | apellido1 |
+--------+-----------+
```

```sql

```

-- 9.  Empleados que atendieron a clientes de Madrid:

```sql
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
```

```sql

```

-- 10. Ventas superiores a 2000€ con datos de clientes:

```sql
+----+---------+------------+------------+-------------+--------+-----------+
| id |  total  |   fecha    | id_cliente | id_empleado | nombre | apellido1 |
+----+---------+------------+------------+-------------+--------+-----------+
```

```sql

```

-- 11. Promedio de ventas por empleado (sin JOIN):

```sql
+-----------+------------------+
|  nombre   | promedio_ventas  |
+-----------+------------------+
```

```sql

```

-- 12. Clientes que no han comprado (sin JOIN):

```sql
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
```

```sql

```