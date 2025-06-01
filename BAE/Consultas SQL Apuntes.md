# 📘 Apuntes SQL: Consultas (Completo y Explicado)

Estos apuntes resumen de forma clara y decorada los conceptos más importantes para dominar las consultas SQL, especialmente útil para estudiantes de ciclos formativos o primeros cursos de bases de datos.

---

## 📌 1. SELECT Básico

```sql
SELECT columna1, columna2
FROM tabla
WHERE condiciones;
```

🔹 Sirve para **leer datos** de una tabla.
🔹 Si no hay `WHERE`, se muestran **todas las filas**.

**Ejemplo:**

```sql
SELECT nombre, ciudad FROM cliente;
```

---

## 🎯 2. WHERE: Filtros y Condiciones

Permite **filtrar registros** según una condición.

### Comparadores:

* `=` igual
* `<>` distinto
* `>` mayor que
* `<` menor que
* `>=`, `<=`

### Operadores útiles:

* `AND`, `OR`, `NOT`
* `BETWEEN a AND b` → dentro de un rango
* `IN (valor1, valor2, ...)` → dentro de una lista
* `LIKE 'A%'` → empieza con 'A'
* `IS NULL` / `IS NOT NULL` → valores nulos

**Ejemplo:**

```sql
SELECT * FROM cliente WHERE ciudad = 'Madrid' AND puntos_fidelidad > 500;
```

---

## 🔃 3. ORDER BY: Ordenar resultados

```sql
ORDER BY columna [ASC | DESC];
```

**Ejemplo:**

```sql
SELECT * FROM cliente ORDER BY puntos_fidelidad DESC;
```

---

## 🔢 4. Funciones de Agregación

Estas funciones trabajan sobre **grupos de datos**:

* `COUNT(*)` → cuenta filas
* `SUM(columna)` → suma total
* `AVG(columna)` → promedio
* `MIN(columna)` / `MAX(columna)`

### Agrupar resultados:

```sql
GROUP BY columna
```

### Filtrar grupos:

```sql
HAVING condición
```

**Ejemplo:**

```sql
SELECT ciudad, COUNT(*)
FROM cliente
GROUP BY ciudad
HAVING COUNT(*) > 2;
```

---

## 🤝 5. JOINs: Unir tablas

### Tipos:

* `INNER JOIN`: solo coincidencias
* `LEFT JOIN`: todo de la izquierda, aunque no haya coincidencia

**Sintaxis típica:**

```sql
SELECT c.nombre, v.total
FROM cliente c
JOIN venta v ON c.id = v.id_cliente;
```

**LEFT JOIN (clientes sin ventas):**

```sql
SELECT c.nombre
FROM cliente c
LEFT JOIN venta v ON c.id = v.id_cliente
WHERE v.id IS NULL;
```

---

## 🔍 6. Subconsultas (Subqueries)

Subconsultas dentro de otra instrucción:

### En `WHERE`:

```sql
SELECT *
FROM venta
WHERE id_cliente IN (
  SELECT id FROM cliente WHERE ciudad = 'Sevilla'
);
```

### En `SELECT`:

```sql
SELECT nombre,
  (SELECT COUNT(*) FROM venta WHERE venta.id_cliente = cliente.id) AS compras
FROM cliente;
```

---

## 🧠 7. Consultas útiles y típicas

### Clientes con más de 1 compra:

```sql
SELECT id_cliente, COUNT(*)
FROM venta
GROUP BY id_cliente
HAVING COUNT(*) > 1;
```

### Cliente con más puntos:

```sql
SELECT * FROM cliente
ORDER BY puntos_fidelidad DESC
LIMIT 1;
```

### Ventas del cliente con más puntos:

```sql
SELECT *
FROM venta
WHERE id_cliente = (
  SELECT id FROM cliente ORDER BY puntos_fidelidad DESC LIMIT 1
);
```

### Empleados que han vendido en todas las ciudades:

```sql
SELECT *
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
```

---

## 💡 8. Trucos útiles

* `DISTINCT` → elimina duplicados.
* `LIMIT n` → limita cantidad de resultados.
* `AS` → alias para columna o tabla.
* `IS NULL` → comprobar si no hay valor (cuidado con `= NULL`, no funciona).

---

## 📚 9. Buenas prácticas

✔ Usar alias (`AS`) para claridad.
✔ Empezar siempre probando consultas pequeñas.
✔ Comentar con `--` cuando sea necesario.
✔ Pensar en el orden lógico:

```
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
```
---



