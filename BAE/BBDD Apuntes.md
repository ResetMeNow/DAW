# Apuntes Combinados: Simulacros de Bases de Datos

Estos apuntes reúnen los contenidos de los tres simulacros de la asignatura de Bases de Datos (DAW), centrados en la creación de esquemas, consultas SQL, índices, vistas, funciones, procedimientos y triggers. Aquí encontrarás:

* **Esquemas y datos de ejemplo**
* **Consultas básicas y avanzadas** (JOIN, WHERE, SUBQUERIES, agregaciones, condicionales)
* **Creación y uso de índices**
* **Definición de vistas**
* **Funciones almacenadas**
* **Procedimientos almacenados**
* **Triggers de auditoría**
* **Buenas prácticas y puntos clave para memorizar**

---

## 1. Esquemas y Datos Iniciales

### 1.1 Simulacro 1: “TecnoMarket”

#### Tablas y relaciones

```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
```

* **clientes** : `id (PK)`, `nombre`, `ciudad`.
* **productos** : `id (PK)`, `nombre`, `precio`.
* **ventas** : `id (PK)`, `cliente_id (FK→clientes.id)`, `producto_id (FK→productos.id)`, `fecha`, `cantidad`.

> **Punto clave**: Las claves foráneas (`FOREIGN KEY`) garantizan integridad referencial. Si intentas insertar una venta con un `cliente_id` o `producto_id` que no exista en la tabla padre, MySQL lanzará un error.

#### Datos de ejemplo (necesarios para las consultas posteriores)

```sql
INSERT INTO clientes (id, nombre, ciudad) VALUES
(1, 'Ana Pérez', 'Madrid'),
(2, 'Luis Gómez', 'Barcelona'),
(3, 'Carla Ruiz', 'Valencia');

INSERT INTO productos (id, nombre, precio) VALUES
(1, 'Laptop', 1200.00),
(2, 'Teclado', 50.00),
(3, 'Monitor', 300.00);

INSERT INTO ventas (id, cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, 1, '2024-05-01', 1),
(2, 1, 2, '2024-05-12', 2),
(3, 2, 3, '2024-05-13', 1),
(4, 3, 2, '2024-05-14', 1);
```

---

### 1.2 Simulacro 2: “Universidad (fase básica)”

En este simulacro gestionamos cuatro entidades:

* **estudiantes**
* **profesores**
* **cursos**
* **matriculas**

#### Creación de tablas

```sql
-- Tabla estudiantes
CREATE TABLE estudiantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  email VARCHAR(100),
  ciudad VARCHAR(50)
);

-- Tabla profesores
CREATE TABLE profesores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  departamento VARCHAR(50)
);

-- Tabla cursos
CREATE TABLE cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  creditos INT,
  profesor_id INT,
  FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);

-- Tabla matriculas
CREATE TABLE matriculas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_id INT,
  curso_id INT,
  fecha DATE,
  FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);
```

> **Punto clave**: Todas las relaciones están definidas con `FOREIGN KEY`. Antes de insertar en `cursos` o `matriculas`, deben existir los registros en las tablas referenciadas.

---

### 1.3 Simulacro 3: “Universidad (fase avanzada)”

Se trabaja sobre la misma base de datos “universidad” del simulacro 2, pero profundizando en:

* Consultas avanzadas (agregaciones, IF/CASE, subconsultas complejas)
* Procedimientos con validaciones
* Vistas más completas
* Funciones de agregación por año
* Índices compuestos
* Triggers de auditoría

---

## 2. Consultas SQL: Básicas y Avanzadas

A continuación se recopilan las consultas más importantes de los tres simulacros, organizadas por tipo.

---

### 2.1 Consultas Sencillas (SELECT \* / SELECT columnas)

#### Simulacro 1 (ventas/clients/productos)

* Mostrar todos los productos:

  ```sql
  SELECT * FROM productos;
  ```
* Mostrar todos los clientes:

  ```sql
  SELECT * FROM clientes;
  ```
* Mostrar todas las ventas:

  ```sql
  SELECT * FROM ventas;
  ```

#### Simulacro 2 (universidad)

* Mostrar todos los cursos:

  ```sql
  SELECT * FROM cursos;
  ```
* Mostrar nombres de todos los profesores:

  ```sql
  SELECT nombre FROM profesores;
  ```
* Listar todas las matrículas:

  ```sql
  SELECT * FROM matriculas;
  ```
* Mostrar nombres y correos de estudiantes:

  ```sql
  SELECT nombre, email FROM estudiantes;
  ```
* Mostrar cursos y créditos:

  ```sql
  SELECT nombre, creditos FROM cursos;
  ```

#### Simulacro 3 (estructura y consultas exploratorias)

* Ver estructura (columnas) de una tabla (alternativa a DESCRIBE):

  ```sql
  SELECT * FROM estudiantes LIMIT 0;
  SELECT * FROM cursos    LIMIT 0;
  SELECT * FROM matriculas LIMIT 0;
  ```

  > **Punto clave**: `LIMIT 0` no extrae filas, pero muestra la cabecera de la tabla en interfaces que listan columnas.

---

### 2.2 Consultas con WHERE (filtrado simple y combinado)

Usar siempre `WHERE` para restringir filas. Si hay varias tablas, enlazar con `JOIN` o en el `WHERE` del estilo implícito (`tabla1.campo = tabla2.campo`).

#### Ejemplos Simulacro 1

* Ventas de un cliente específico (id = 1):

  ```sql
  SELECT *
  FROM ventas
  WHERE cliente_id = 1;
  ```

* Ventas en un rango de fechas (mayo 2024):

  ```sql
  SELECT *
  FROM ventas
  WHERE fecha BETWEEN '2024-05-01' AND '2024-05-31';
  ```

#### Ejemplos Simulacro 2

* Estudiantes que viven en “Madrid”:

  ```sql
  SELECT *
  FROM estudiantes
  WHERE ciudad = 'Madrid';
  ```
* Cursos con más de 5 créditos:

  ```sql
  SELECT *
  FROM cursos
  WHERE creditos > 5;
  ```
* Matrículas posteriores a 2022:

  ```sql
  SELECT *
  FROM matriculas
  WHERE YEAR(fecha) > 2022;
  ```
* Cursos de “Dra. Ana Torres”:

  ```sql
  SELECT c.nombre
  FROM cursos c, profesores p
  WHERE c.profesor_id = p.id
    AND p.nombre = 'Dra. Ana Torres';
  ```

#### Ejemplos Simulacro 3

* Estudiantes en más de 1 curso (HAVING):

  ```sql
  SELECT e.nombre, COUNT(m.id) AS total_matriculas
  FROM estudiantes e
  JOIN matriculas m ON e.id = m.estudiante_id
  GROUP BY e.id
  HAVING total_matriculas > 1;
  ```

* Cursos impartidos por “Dr. Luis Gómez”:

  ```sql
  SELECT c.nombre
  FROM cursos c
  JOIN profesores p ON c.profesor_id = p.id
  WHERE p.nombre = 'Dr. Luis Gómez';
  ```

* Cursos sin estudiantes (IS NULL en LEFT JOIN):

  ```sql
  SELECT c.nombre
  FROM cursos c
  LEFT JOIN matriculas m ON c.id = m.curso_id
  WHERE m.id IS NULL;
  ```

> **Puntos clave (WHERE)**
>
> * Siempre vincular tablas relacionadas con condiciones en el `WHERE` o usar `JOIN`.
> * Para rangos de fecha usar `BETWEEN` o funciones de fecha (`YEAR()`, `MONTH()`).
> * Combinar múltiples condiciones con `AND` / `OR`.
> * Validar que las columnas en el `WHERE` estén indexadas si la tabla es grande.

---

### 2.3 Consultas con JOIN (INNER, LEFT)

#### JOIN implícito vs JOIN explícito

* **Implícito** (vieja sintaxis, no recomendada):

  ```sql
  SELECT c.nombre
  FROM cursos c, profesores p
  WHERE c.profesor_id = p.id
    AND p.departamento = 'Informática';
  ```
* **Explícito (recomendado)**:

  ```sql
  SELECT c.nombre
  FROM cursos c
  JOIN profesores p ON c.profesor_id = p.id
  WHERE p.departamento = 'Informática';
  ```

#### Ejemplos Simulacro 1

* Detalle de ventas (cliente + producto):

  ```sql
  SELECT
    v.id        AS venta_id,
    c.nombre    AS cliente,
    p.nombre    AS producto,
    v.fecha,
    v.cantidad,
    (p.precio * v.cantidad) AS total
  FROM ventas v
  JOIN clientes c ON v.cliente_id = c.id
  JOIN productos p ON v.producto_id = p.id;
  ```

#### Ejemplos Simulacro 2

* Cursos de profesores de “Informática”:

  ```sql
  SELECT c.nombre
  FROM cursos c
  JOIN profesores p ON c.profesor_id = p.id
  WHERE p.departamento = 'Informática';
  ```
* Matrículas con nombre de estudiante y curso:

  ```sql
  SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    m.fecha
  FROM matriculas m
  JOIN estudiantes e ON m.estudiante_id = e.id
  JOIN cursos c ON m.curso_id = c.id;
  ```

#### Ejemplos Simulacro 3

* Cada estudiante con número de cursos (LEFT JOIN + GROUP BY):

  ```sql
  SELECT e.nombre, COUNT(m.curso_id) AS total_cursos
  FROM estudiantes e
  LEFT JOIN matriculas m ON e.id = m.estudiante_id
  GROUP BY e.id;
  ```
* Total de créditos por estudiante:

  ```sql
  SELECT e.nombre, COALESCE(SUM(c.creditos), 0) AS total_creditos
  FROM estudiantes e
  LEFT JOIN matriculas m ON e.id = m.estudiante_id
  LEFT JOIN cursos c ON m.curso_id = c.id
  GROUP BY e.id;
  ```
* Cursos con total de estudiantes (ORDER BY descendente):

  ```sql
  SELECT c.nombre, COUNT(m.estudiante_id) AS total_estudiantes
  FROM cursos c
  LEFT JOIN matriculas m ON c.id = m.curso_id
  GROUP BY c.id
  ORDER BY total_estudiantes DESC;
  ```
* Profesores sin cursos:

  ```sql
  SELECT p.nombre
  FROM profesores p
  LEFT JOIN cursos c ON p.id = c.profesor_id
  WHERE c.id IS NULL;
  ```

> **Puntos clave (JOIN)**
>
> * **INNER JOIN** (lo mismo que `JOIN` a secas): devuelve solo filas que cumplan la condición de emparejamiento.
> * **LEFT JOIN**: devuelve todas las filas de la tabla izquierda, aun si no hay coincidencia en la tabla derecha (columnas de la derecha serán `NULL`).
> * `LEFT JOIN … WHERE tabla_derecha.columna IS NULL` sirve para encontrar “huérfanos” (sin relación).
> * Indexar las columnas usadas en `ON` acelera el emparejamiento (`JOIN`).

---

### 2.4 Consultas con Subconsultas (Subqueries)

#### Subconsultas en cláusula WHERE

* **Simulacro 1**: Productos por ventas de clientes de un rango… (ejemplo genérico):

  ```sql
  SELECT nombre
  FROM productos
  WHERE id IN (
    SELECT producto_id
    FROM ventas
    WHERE cliente_id = 1
  );
  ```

* **Simulacro 2**: Cursos impartidos por profesores de “Informática” mediante subconsulta:

  ```sql
  SELECT nombre
  FROM cursos
  WHERE profesor_id IN (
    SELECT id
    FROM profesores
    WHERE departamento = 'Informática'
  );
  ```

* **Simulacro 2**: Estudiantes que viven en “Madrid” en subconsulta (redundante—concepto didáctico):

  ```sql
  SELECT *
  FROM estudiantes
  WHERE id IN (
    SELECT id
    FROM estudiantes
    WHERE ciudad = 'Madrid'
  );
  ```

  (En la práctica, es equivalente a `WHERE ciudad = 'Madrid'`).

* **Simulacro 2**: Cursos con más de 5 créditos en subconsulta:

  ```sql
  SELECT *
  FROM cursos
  WHERE id IN (
    SELECT id
    FROM cursos
    WHERE creditos > 5
  );
  ```

* **Simulacro 2**: Matrículas posteriores a 2022 usando subconsulta:

  ```sql
  SELECT *
  FROM matriculas
  WHERE id IN (
    SELECT id
    FROM matriculas
    WHERE YEAR(fecha) > 2022
  );
  ```

* **Simulacro 2**: Cursos de “Dra. Ana Torres” por subconsulta de profesor:

  ```sql
  SELECT nombre
  FROM cursos
  WHERE profesor_id = (
    SELECT id
    FROM profesores
    WHERE nombre = 'Dra. Ana Torres'
  );
  ```

> **Puntos clave (Subconsultas)**
>
> * Una subconsulta en `WHERE … IN (SELECT …)` devuelve filas basadas en un conjunto de valores.
> * Mejor usar `JOIN` en consultas complejas por claridad y, frecuentemente, por rendimiento.
> * Subconsultas escalares (que devuelven un único valor) pueden usarse en `WHERE columna = (SELECT …)`.
> * Subconsultas correlacionadas (referencian columnas externas) pueden ser lentas en tablas grandes.

---

### 2.5 Consultas con Agregaciones y Funciones de Grupo (GROUP BY, HAVING, AVG, COUNT, SUM)

#### Simulacro 3: Agregaciones comunes

1. **Cantidad de cursos por estudiante**:

   ```sql
   SELECT e.nombre, COUNT(m.curso_id) AS total_cursos
   FROM estudiantes e
   LEFT JOIN matriculas m ON e.id = m.estudiante_id
   GROUP BY e.id;
   ```

2. **Total de créditos por estudiante**:

   ```sql
   SELECT e.nombre, COALESCE(SUM(c.creditos), 0) AS total_creditos
   FROM estudiantes e
   LEFT JOIN matriculas m ON e.id = m.estudiante_id
   LEFT JOIN cursos c ON m.curso_id = c.id
   GROUP BY e.id;
   ```

   * `COALESCE(a, 0)` devuelve `0` si `a` es `NULL`, útil para estudiantes sin matrícula.

3. **Cursos con número de estudiantes, orden descendente**:

   ```sql
   SELECT c.nombre, COUNT(m.estudiante_id) AS total_estudiantes
   FROM cursos c
   LEFT JOIN matriculas m ON c.id = m.curso_id
   GROUP BY c.id
   ORDER BY total_estudiantes DESC;
   ```

4. **Media de créditos por curso**:

   ```sql
   SELECT AVG(creditos) AS media_creditos
   FROM cursos;
   ```

5. **Cursos sin estudiantes**:

   ```sql
   SELECT c.nombre
   FROM cursos c
   LEFT JOIN matriculas m ON c.id = m.curso_id
   WHERE m.id IS NULL;
   ```

6. **Profesores y cuántos cursos imparten**:

   ```sql
   SELECT p.nombre, COUNT(c.id) AS cursos_imparte
   FROM profesores p
   LEFT JOIN cursos c ON p.id = c.profesor_id
   GROUP BY p.id;
   ```

7. **Profesores sin cursos**:

   ```sql
   SELECT p.nombre
   FROM profesores p
   LEFT JOIN cursos c ON p.id = c.profesor_id
   WHERE c.id IS NULL;
   ```

8. **Ciudad con más estudiantes registrados**:

   ```sql
   SELECT ciudad, COUNT(*) AS total
   FROM estudiantes
   GROUP BY ciudad
   ORDER BY total DESC
   LIMIT 1;
   ```

9. **Estudiantes matriculados en más de 1 curso** (HAVING):

   ```sql
   SELECT e.nombre, COUNT(m.id) AS total_matriculas
   FROM estudiantes e
   JOIN matriculas m ON e.id = m.estudiante_id
   GROUP BY e.id
   HAVING total_matriculas > 1;
   ```

---

### 2.6 Consultas con IF, CASE y Condicionales

#### Simulacro 3: Clasificación condicional con `IF` (o `CASE`)

1. **Clasificación de cursos según créditos**:

   ```sql
   SELECT nombre,
     IF(creditos >= 6, 'Alta carga', 'Carga estándar') AS clasificacion
   FROM cursos;
   ```

   Alternativa con `CASE`:

   ```sql
   SELECT nombre,
     CASE
       WHEN creditos >= 6 THEN 'Alta carga'
       ELSE 'Carga estándar'
     END AS clasificacion
   FROM cursos;
   ```

2. **Clasificación de estudiantes según créditos totales**:

   ```sql
   SELECT e.nombre,
     SUM(c.creditos) AS total_creditos,
     IF(
       SUM(c.creditos) > 12, 'Carga Alta',
       IF(SUM(c.creditos) >= 6, 'Carga Media', 'Carga Baja')
     ) AS clasificacion
   FROM estudiantes e
   LEFT JOIN matriculas m ON e.id = m.estudiante_id
   LEFT JOIN cursos c ON m.curso_id = c.id
   GROUP BY e.id;
   ```

3. **Cursos en que se matriculó al menos un estudiante de “Sevilla”**:

   ```sql
   SELECT DISTINCT c.nombre
   FROM cursos c
   JOIN matriculas m ON c.id = m.curso_id
   JOIN estudiantes e ON m.estudiante_id = e.id
   WHERE e.ciudad = 'Sevilla';
   ```

4. **Cursos impartidos por profesores de “Matemáticas”**:

   ```sql
   SELECT c.nombre
   FROM cursos c
   JOIN profesores p ON c.profesor_id = p.id
   WHERE p.departamento = 'Matemáticas';
   ```

5. **Cursos con matrículas anteriores a 2022**:

   ```sql
   SELECT DISTINCT c.nombre
   FROM cursos c
   JOIN matriculas m ON c.id = m.curso_id
   WHERE YEAR(m.fecha) < 2022;
   ```

6. **Estudiantes que han cursado materias de “Dr. Luis Gómez”**:

   ```sql
   SELECT DISTINCT e.nombre
   FROM estudiantes e
   JOIN matriculas m ON e.id = m.estudiante_id
   JOIN cursos c ON m.curso_id = c.id
   JOIN profesores p ON c.profesor_id = p.id
   WHERE p.nombre = 'Dr. Luis Gómez';
   ```

7. **Última matrícula por curso (MAX + GROUP BY)**:

   ```sql
   SELECT c.nombre, MAX(m.fecha) AS ultima_matricula
   FROM cursos c
   JOIN matriculas m ON c.id = m.curso_id
   GROUP BY c.id;
   ```

8. **Número total de estudiantes por departamento**:

   ```sql
   SELECT p.departamento, COUNT(DISTINCT m.estudiante_id) AS total_estudiantes
   FROM profesores p
   JOIN cursos c ON p.id = c.profesor_id
   JOIN matriculas m ON c.id = m.curso_id
   GROUP BY p.departamento;
   ```

> **Puntos clave (Agregaciones + IF/CASE)**
>
> * Siempre usar `GROUP BY` con todas las columnas no agregadas en el `SELECT`.
> * `HAVING` filtra después de agrupar (p.ej., “> 1 curso”).
> * `IF(condición, valor_si_verdadero, valor_si_falso)` es equivalente a un `CASE` sencillo.
> * Para múltiples condiciones anidadas, se pueden usar `IF` anidados o un bloque `CASE … WHEN … THEN … WHEN … ELSE … END`.
> * `COALESCE(valor, alternativo)` reemplaza valores nulos en agregaciones.

---

## 3. Creación de Índices

### 3.1 Por qué usar índices

* Aceleran búsquedas (`SELECT … WHERE columna = …`), `JOIN`, `ORDER BY`, `GROUP BY`.
* Penalizan operaciones de escritura (`INSERT`, `UPDATE`, `DELETE`) porque hay que mantener el índice.
* Ocupan espacio adicional en disco.

> **Punto clave**: Indexar columnas que se usan en filtros frecuentes o en condiciones `JOIN`. No indexar columnas con baja selectividad (ej. `boolean`, pocos valores distintos).

---

### 3.2 Simulacro 1: Índices en “TecnoMarket”

1. **Índice en `clientes(ciudad)`**:

   ```sql
   CREATE INDEX idx_ciudad ON clientes(ciudad);
   ```

   * Ventaja: acelera consultas como `WHERE ciudad = '...'`.

2. **Índice en `ventas(fecha)`**:

   ```sql
   CREATE INDEX idx_fecha ON ventas(fecha);
   ```

   * Ventaja: acelera rangos de fecha `BETWEEN`, filtrado por año/mes.

#### Comprobación de uso (EXPLAIN)

```sql
EXPLAIN
SELECT *
FROM clientes
WHERE ciudad = 'Madrid';
```

* Si se usa `idx_ciudad`, la columna **key** mostrará `idx_ciudad`.
* La columna **rows** será menor que el tamaño total de la tabla, indicando que se está usando el índice.

```sql
EXPLAIN
SELECT *
FROM ventas
WHERE fecha BETWEEN '2024-05-01' AND '2024-05-31';
```

* Aparecerá `idx_fecha` en **key**, confirmando el uso de índice en rangos.

---

### 3.3 Simulacro 2: Índices básicos

1. **Índice en `estudiantes(ciudad)`**:

   ```sql
   CREATE INDEX idx_ciudad_estudiantes ON estudiantes(ciudad);
   ```
2. **Índice en `profesores(departamento)`**:

   ```sql
   CREATE INDEX idx_departamento_profesores ON profesores(departamento);
   ```
3. **Consultar índices**:

   ```sql
   SHOW INDEX FROM estudiantes;
   SHOW INDEX FROM profesores;
   ```
4. **Eliminar índices**:

   ```sql
   DROP INDEX idx_ciudad_estudiantes ON estudiantes;
   DROP INDEX idx_departamento_profesores ON profesores;
   ```

> **Punto clave**: Siempre verificar con `SHOW INDEX` y `EXPLAIN` si el índice se está usando o no. Si no se usa (por baja selectividad o consulta diferente), conviene eliminarlo.

---

### 3.4 Simulacro 3: Índices avanzados

1. **Índice en `matriculas(fecha)`**:

   ```sql
   CREATE INDEX idx_fecha ON matriculas(fecha);
   ```

   * Acelera consultas que filtran o agrupan por `fecha` (ej. `YEAR(fecha) = 2023`).

2. **Índice compuesto en `matriculas(estudiante_id, curso_id)`**:

   ```sql
   CREATE INDEX idx_est_curso ON matriculas(estudiante_id, curso_id);
   ```

   * Útil para:

     * Evitar duplicados cuando se verifica `(estudiante_id, curso_id)` en un procedimiento.
     * Acelerar consultas que filtran por ambos campos simultáneamente, p.ej.

       ```sql
       SELECT *
       FROM matriculas
       WHERE estudiante_id = 1 AND curso_id = 2;
       ```

3. **Consultar índices**:

   ```sql
   SHOW INDEX FROM matriculas;
   ```

4. **Eliminar índices**:

   ```sql
   DROP INDEX idx_fecha    ON matriculas;
   DROP INDEX idx_est_curso ON matriculas;
   ```

> **Punto clave**: Los índices compuestos deben crearse en el orden de uso típico (`WHERE a = x AND b = y`), garantizando que la consulta aproveche el inicio del índice. Si se consulta a menudo solo por `estudiante_id`, este índice compuesto también ayudará a cubrir la búsqueda por la primera columna (`estudiante_id`).

---

## 4. Vistas

Una **vista** es una tabla virtual basada en el resultado de una consulta. Permite encapsular `JOIN`, filtros y cálculos para simplificar el acceso y dar permisos de lectura.

---

### 4.1 Simulacro 1: Vista de ventas

```sql
CREATE OR REPLACE VIEW vista_ventas AS
SELECT
  v.id              AS venta_id,
  c.nombre          AS cliente,
  p.nombre          AS producto,
  v.fecha,
  v.cantidad,
  (p.precio * v.cantidad) AS total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
JOIN productos p ON v.producto_id = p.id;
```

* **Uso**:

  ```sql
  SELECT * FROM vista_ventas;
  ```
* **Extensión (incluir ciudad)**:

  ```sql
  CREATE OR REPLACE VIEW vista_ventas_ciudad AS
  SELECT
    v.id                    AS venta_id,
    c.nombre                AS cliente,
    c.ciudad                AS ciudad,
    p.nombre                AS producto,
    v.fecha,
    v.cantidad,
    (p.precio * v.cantidad) AS total
  FROM ventas v
  JOIN clientes c ON v.cliente_id = c.id
  JOIN productos p ON v.producto_id = p.id;
  ```
* **Eliminar vista**:

  ```sql
  DROP VIEW IF EXISTS vista_ventas;
  DROP VIEW IF EXISTS vista_ventas_ciudad;
  ```

> **Beneficios de las vistas**
>
> 1. **Abstracción**: ocultan la complejidad de los `JOIN`.
> 2. **Reutilización**: varias consultas pueden invocar la vista sin duplicar lógica.
> 3. **Permisos**: se puede dar permiso solo a la vista sin exponer tablas base.

---

### 4.2 Simulacro 2: Vista de matrículas completas

```sql
CREATE VIEW vista_matriculas_completas AS
SELECT
  e.nombre AS nombre_estudiante,
  c.nombre AS nombre_curso,
  m.fecha   AS fecha_matricula
FROM matriculas m
JOIN estudiantes e ON m.estudiante_id = e.id
JOIN cursos c ON m.curso_id = c.id;
```

* **Uso (ejemplo)**:

  ```sql
  SELECT nombre_estudiante, fecha_matricula
  FROM vista_matriculas_completas;
  ```
* **Eliminar vista**:

  ```sql
  DROP VIEW IF EXISTS vista_matriculas_completas;
  ```

---

### 4.3 Simulacro 3: Vista de resumen de matrículas

```sql
CREATE VIEW resumen_matriculas AS
SELECT
  e.nombre AS estudiante,
  c.nombre AS curso,
  p.nombre AS profesor,
  m.fecha  AS fecha_matricula
FROM matriculas m
JOIN estudiantes e ON m.estudiante_id = e.id
JOIN cursos c ON m.curso_id = c.id
JOIN profesores p ON c.profesor_id = p.id;
```

* **Uso**:

  ```sql
  SELECT estudiante, curso
  FROM resumen_matriculas;
  ```
* **Eliminar vista**:

  ```sql
  DROP VIEW IF EXISTS resumen_matriculas;
  ```

---

## 5. Funciones Almacenadas (UDF: User-Defined Functions)

Las funciones almacenadas devuelven un único valor y pueden usarse dentro de `SELECT`, `WHERE`, etc. Se declaran con `CREATE FUNCTION` y **deben especificar**:

* Nombre de la función
* Parámetros de entrada (`IN`) con su tipo
* Tipo de dato de retorno (`RETURNS`)
* `DETERMINISTIC` (siempre que devuelvan el mismo resultado con los mismos parámetros)
* `BEGIN … END` con la lógica interna

> **Punto clave**:
>
> * Si la función no depende de datos externos o valores variables (como `NOW()`, `RAND()`), declárala **`DETERMINISTIC`**.
> * Si devuelve un valor distinto en cada llamada (uso de `NOW()`, tablas de auditoría, lectura de un fichero, etc.), debe marcarse **`NOT DETERMINISTIC`**.

---

### 5.1 Simulacro 1: Función `calcular_total`

```sql
DELIMITER //
CREATE FUNCTION calcular_total(
  precio DECIMAL(10,2),
  cantidad INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN precio * cantidad;
END;
//
DELIMITER ;
```

* **Uso**:

  ```sql
  SELECT calcular_total(1200.00, 2) AS total_ejemplo;
  ```

  Resultado: `2400.00`.

---

### 5.2 Simulacro 2: Función `total_creditos_estudiante`

```sql
DELIMITER $$
CREATE FUNCTION total_creditos_estudiante(est_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT SUM(c.creditos) INTO total
  FROM matriculas m
  JOIN cursos c ON m.curso_id = c.id
  WHERE m.estudiante_id = est_id;
  RETURN IFNULL(total, 0);
END $$
DELIMITER ;
```

* **IFNULL(total, 0)**: devuelve `0` si `total` es `NULL` (estudiante sin matrículas).
* **Uso**:

  ```sql
  SELECT total_creditos_estudiante(1);
  ```
* **Eliminar**:

  ```sql
  DROP FUNCTION IF EXISTS total_creditos_estudiante;
  ```

---

### 5.3 Simulacro 3: Función `promedio_creditos_por_anio`

```sql
DELIMITER //
CREATE FUNCTION promedio_creditos_por_anio(anio INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE promedio DECIMAL(5,2);
  SELECT AVG(c.creditos) INTO promedio
  FROM matriculas m
  JOIN cursos c ON m.curso_id = c.id
  WHERE YEAR(m.fecha) = anio;
  RETURN promedio;
END;
//
DELIMITER ;
```

* **Uso**:

  ```sql
  SELECT promedio_creditos_por_anio(2023);
  ```
* **Eliminar**:

  ```sql
  DROP FUNCTION IF EXISTS promedio_creditos_por_anio;
  ```

---

## 6. Procedimientos Almacenados (Stored Procedures)

Los procedimientos se crean con `CREATE PROCEDURE` y pueden tener parámetros de entrada (`IN`), salida (`OUT`) o ambos (`INOUT`). Se invocan con `CALL nombre_procedimiento(…)`. Son ideales para:

* Agrupar varias sentencias SQL
* Lógica condicional con variables locales
* Validaciones y manejo de errores mediante `SIGNAL`

> **Puntos clave (Procedimientos)**
>
> * Declarar `DELIMITER` distinto para encerrar el bloque completo.
> * Dentro de un procedimiento se pueden usar variables locales (`DECLARE var TIPO;`).
> * Para lanzar errores personalizados usar `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error …';`.
> * Usar `IF … THEN … ELSE … END IF;` para lógica condicional.

---

### 6.1 Simulacro 1: Procedimiento `resumen_cliente`

```sql
DELIMITER //
CREATE PROCEDURE resumen_cliente(IN p_cliente_id INT)
BEGIN
  SELECT
    c.nombre         AS nombre,
    v.fecha          AS fecha,
    p.nombre         AS producto,
    v.cantidad       AS cantidad,
    calcular_total(p.precio, v.cantidad) AS total
  FROM ventas v
  JOIN clientes c ON v.cliente_id = c.id
  JOIN productos p ON v.producto_id = p.id
  WHERE c.id = p_cliente_id;
END;
//
DELIMITER ;
```

* **Uso**:

  ```sql
  CALL resumen_cliente(1);
  ```

  Muestra todas las ventas del cliente 1 (Ana Pérez).

#### Variante 1: Filtrar rango de fechas

```sql
DELIMITER //
CREATE PROCEDURE resumen_cliente_rango(
    IN p_cliente_id INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
  SELECT
    c.nombre         AS nombre,
    v.fecha          AS fecha,
    p.nombre         AS producto,
    v.cantidad       AS cantidad,
    calcular_total(p.precio, v.cantidad) AS total
  FROM ventas v
  JOIN clientes c ON v.cliente_id = c.id
  JOIN productos p ON v.producto_id = p.id
  WHERE c.id = p_cliente_id
    AND v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin;
END;
//
DELIMITER ;
```

* **Uso**:

  ```sql
  CALL resumen_cliente_rango(1, '2024-05-01', '2024-05-31');
  ```

#### Variante 2: Validar existencia de cliente

```sql
DELIMITER //
CREATE PROCEDURE resumen_cliente_validado(
    IN p_cliente_id INT
)
BEGIN
  DECLARE v_count INT DEFAULT 0;

  SELECT COUNT(*) INTO v_count
  FROM clientes
  WHERE id = p_cliente_id;

  IF v_count = 0 THEN
    SELECT CONCAT('El cliente con ID = ', p_cliente_id, ' no existe.') AS mensaje;
  ELSE
    SELECT
      c.nombre         AS nombre,
      v.fecha          AS fecha,
      p.nombre         AS producto,
      v.cantidad       AS cantidad,
      calcular_total(p.precio, v.cantidad) AS total
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN productos p ON v.producto_id = p.id
    WHERE c.id = p_cliente_id;
  END IF;
END;
//
DELIMITER ;
```

* Si el cliente no existe, devuelve un mensaje en lugar de filas en blanco.

* **Uso**:

  ```sql
  CALL resumen_cliente_validado(999);
  ```

* **Eliminar**:

  ```sql
  DROP PROCEDURE IF EXISTS resumen_cliente;
  DROP PROCEDURE IF EXISTS resumen_cliente_rango;
  DROP PROCEDURE IF EXISTS resumen_cliente_validado;
  ```

---

### 6.2 Simulacro 2: Procedimiento `cursos_por_profesor`

```sql
DELIMITER $$
CREATE PROCEDURE cursos_por_profesor(IN nombre_profesor VARCHAR(100))
BEGIN
  SELECT c.nombre, c.creditos
  FROM cursos c
  JOIN profesores p ON c.profesor_id = p.id
  WHERE p.nombre = nombre_profesor;
END $$
DELIMITER ;
```

* **Uso**:

  ```sql
  CALL cursos_por_profesor('Dr. Luis Gómez');
  ```
* **Eliminar**:

  ```sql
  DROP PROCEDURE IF EXISTS cursos_por_profesor;
  ```

---

### 6.3 Simulacro 3: Procedimiento `inscribir_estudiante`

```sql
DELIMITER //
CREATE PROCEDURE inscribir_estudiante(
    IN est_id INT,
    IN curso_id INT,
    IN fecha DATE
)
BEGIN
  DECLARE existe INT;

  SELECT COUNT(*) INTO existe
  FROM matriculas
  WHERE estudiante_id = est_id
    AND curso_id = curso_id;

  IF existe = 0 THEN
    INSERT INTO matriculas(estudiante_id, curso_id, fecha)
    VALUES (est_id, curso_id, fecha);
  ELSE
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Estudiante ya está matriculado en este curso';
  END IF;
END;
//
DELIMITER ;
```

* **Uso (prueba de error)**:

  ```sql
  CALL inscribir_estudiante(1, 2, '2025-05-30');
  ```

  * Si el estudiante 1 ya está en el curso 2, lanza el `SIGNAL` con el mensaje personalizado.
  * Si no existe la matrícula, la inserta.

* **Eliminar**:

  ```sql
  DROP PROCEDURE IF EXISTS inscribir_estudiante;
  ```

> **Punto clave (SIGNAL SQLSTATE)**
>
> * `SQLSTATE '45000'` es un código genérico de error (estado de “excepción definida por el usuario”).
> * `SET MESSAGE_TEXT` define el texto del error devuelto.

---

## 7. Triggers de Auditoría

Un **trigger** es un bloque de código que se ejecuta automáticamente ante eventos `INSERT`, `UPDATE` o `DELETE` en una tabla. Se usa habitualmente para auditoría o mantener datos derivados.

### 7.1 Simulacro 3: Auditoría de “matriculas”

#### 7.1.1 Crear tabla de auditoría

```sql
CREATE TABLE auditoria_matriculas (
  operacion      VARCHAR(10),
  estudiante_id  INT,
  curso_id       INT,
  fecha_hora     DATETIME,
  usuario        VARCHAR(100)
);
```

* **campos**:

  * `operacion`: tipo de acción (`'INSERT'`, `'UPDATE'`, `'DELETE'`)
  * `estudiante_id`, `curso_id`
  * `fecha_hora`: timestamp de la operación (`NOW()`)
  * `usuario`: usuario MySQL que realizó la acción (`CURRENT_USER()`)

#### 7.1.2 Crear trigger AFTER INSERT

```sql
DELIMITER //
CREATE TRIGGER after_insert_matricula
AFTER INSERT ON matriculas
FOR EACH ROW
BEGIN
  INSERT INTO auditoria_matriculas(
    operacion,
    estudiante_id,
    curso_id,
    fecha_hora,
    usuario
  )
  VALUES (
    'INSERT',
    NEW.estudiante_id,
    NEW.curso_id,
    NOW(),
    CURRENT_USER()
  );
END;
//
DELIMITER ;
```

* **NEW\.columna**: hace referencia a los valores recién insertados en `matriculas`.
* Se dispara **después** de cada `INSERT`, y registra en la tabla de auditoría.

#### 7.1.3 Consultar auditoría y limpieza

* **Consultar registros**:

  ```sql
  SELECT * FROM auditoria_matriculas;
  ```
* **Eliminar trigger**:

  ```sql
  DROP TRIGGER IF EXISTS after_insert_matricula;
  ```
* **Eliminar tabla de auditoría**:

  ```sql
  DROP TABLE IF EXISTS auditoria_matriculas;
  ```

> **Punto clave (Triggers)**
>
> * Los triggers **AFTER** se ejecutan tras la operación DML; los **BEFORE** se ejecutan antes.
> * Dentro de un trigger de `INSERT`, se usan `NEW.columna`; en uno de `DELETE`, se usan `OLD.columna`.
> * Un trigger puede aumentar el tiempo de inserción, ya que ejecuta lógica extra para cada fila.

---

## 8. Pasos para Resolver Consultas y Ejercicios (Guía Rápida)

1. **Leer detenidamente el enunciado**: identificar qué tablas intervienen y qué columnas se necesitan.
2. **Determinar si es consulta simple o combinada**:

   * Si solo se pide información de una tabla, usar SELECT directo con `WHERE` si es necesario.
   * Si intervienen varias tablas, decidir entre `JOIN` o subconsulta (`IN`, `EXISTS`).
   * Recomendada la sintaxis `JOIN … ON …` para mayor claridad.
3. **Identificar condiciones de filtrado** (`WHERE … AND/OR …`).

   * Filtrar primero las tablas más grandes o con índices.
   * Para rangos de fecha, usar `BETWEEN` o funciones de fecha (`YEAR()`, `MONTH()`).
4. **Decidir si se necesita agrupar** (`GROUP BY`) y calcular agregados (`COUNT`, `SUM`, `AVG`).

   * Usar `HAVING` para filtrar resultados ya agregados (p.ej., “> 1 curso”).
5. **Añadir clasificaciones/condiciones complejas** si se pide (`IF`, `CASE`).
6. **Verificar enunciados de índices**:

   * Crear índices en columnas usadas en claves de unión o filtros frecuentes.
   * Si piden medir rendimiento, usar `EXPLAIN` y revisar la columna **key** y **rows**.
   * Decidir si el índice es selectivo (columna con muchos valores distintos) o no.
7. **Crear vistas** para consultas que se repiten con lógica compleja de `JOIN` o agregaciones.

   * Nombrar la vista de forma descriptiva (p.ej., `vista_matriculas_completas`).
   * Incluir siempre los campos solicitados en el enunciado.
8. **Funciones y procedimientos**:

   * Función: si solo devuelven un valor escalar (p.ej., calcular un total).
   * Procedimiento: si se agrupan varias sentencias, validaciones, o devolvemos conjuntos de filas.
   * Declarar `DETERMINISTIC` si la función es “pura” (siempre mismo resultado para mismos parámetros).
   * Usar `SIGNAL` para errores personalizados en procedimientos.
9. **Triggers**:

   * Definir la tabla de auditoría primero, luego el trigger `AFTER` o `BEFORE`.
   * En el cuerpo del trigger, usar `NEW.columna` o `OLD.columna` según el evento.
10. **Eliminar objetos creados (DROP)** para dejar el entorno limpio después de hacer pruebas.

---

## 9. Resumen de Sintaxis Importante (Para Memorizar)

### 9.1 DDL (Data Definition Language)

* **Crear tabla**:

  ```sql
  CREATE TABLE nombre_tabla (
    columna1 TIPO [constraints],
    columna2 TIPO [constraints],
    …,
    PRIMARY KEY(columna),
    FOREIGN KEY (columna_fk) REFERENCES otra_tabla(columna_pk)
  );
  ```

* **Eliminar tabla**:

  ```sql
  DROP TABLE IF EXISTS nombre_tabla;
  ```

* **Crear índice simple**:

  ```sql
  CREATE INDEX idx_nombre ON tabla(columna);
  ```

* **Crear índice compuesto**:

  ```sql
  CREATE INDEX idx_nombre_compuesto ON tabla(col1, col2);
  ```

* **Eliminar índice**:

  ```sql
  DROP INDEX idx_nombre ON tabla;
  ```

* **Crear vista**:

  ```sql
  CREATE OR REPLACE VIEW nombre_vista AS
  SELECT … FROM … JOIN … WHERE …;
  ```

* **Eliminar vista**:

  ```sql
  DROP VIEW IF EXISTS nombre_vista;
  ```

### 9.2 DML (Data Manipulation Language)

* **SELECT básico**:

  ```sql
  SELECT columna1, columna2, …
  FROM tabla
  [JOIN otra_tabla ON …]
  [WHERE condiciones]
  [GROUP BY columnas]
  [HAVING condiciones_agregado]
  [ORDER BY columna [ASC|DESC]]
  [LIMIT n];
  ```
* **INSERT**:

  ```sql
  INSERT INTO tabla (col1, col2, …) VALUES (val1, val2, …);
  ```
* **UPDATE**:

  ```sql
  UPDATE tabla
  SET columna1 = valor1, columna2 = valor2, …
  WHERE condición;
  ```
* **DELETE**:

  ```sql
  DELETE FROM tabla WHERE condición;
  ```

### 9.3 Subconsultas

* **IN (subconsulta)**:

  ```sql
  SELECT …
  FROM tabla
  WHERE columna IN (SELECT columna2 FROM otra_tabla WHERE …);
  ```
* **Scalar subquery**:

  ```sql
  SELECT columna1,
    (SELECT SUM(otra_columna) FROM otra_tabla WHERE cond) AS total
  FROM tabla_principal;
  ```

### 9.4 Agregaciones y Grupo

* **COUNT**, **SUM**, **AVG**, **MIN**, **MAX**:

  ```sql
  SELECT COUNT(*), SUM(col), AVG(col), MIN(col), MAX(col)
  FROM tabla
  WHERE …;
  ```

* **GROUP BY**:

  ```sql
  SELECT columna_agrupada, AGG_FUNC(columna) AS alias
  FROM tabla
  [JOIN …]
  [WHERE …]
  GROUP BY columna_agrupada
  [HAVING AGG_FUNC(columna) > valor]
  [ORDER BY alias DESC];
  ```

### 9.5 Condicionales en SELECT

* **IF(condición, valor\_si\_verdadero, valor\_si\_falso)**:

  ```sql
  SELECT nombre,
    IF(creditos >= 6, 'Alta carga', 'Carga estándar') AS clasificacion
  FROM cursos;
  ```

* **CASE … WHEN … THEN … ELSE … END**:

  ```sql
  SELECT nombre,
    CASE
      WHEN creditos >= 6 THEN 'Alta carga'
      WHEN creditos >= 3 THEN 'Carga Media'
      ELSE 'Carga Baja'
    END AS clasificacion
  FROM cursos;
  ```

### 9.6 Funciones Almacenadas

```sql
DELIMITER //
CREATE FUNCTION nombre_funcion(
  param1 TIPO,
  param2 TIPO,
  …
) RETURNS TIPO_RETORNO
[DETERMINISTIC | NOT DETERMINISTIC]
BEGIN
  DECLARE var_local TIPO;
  -- Lógica SQL
  RETURN valor;
END;
//
DELIMITER ;
```

* **`SELECT … INTO var_local FROM … WHERE …;`**: almacenar resultado en variable local.
* **`RETURN`**: devuelve el valor al invocarla.

### 9.7 Procedimientos Almacenados

```sql
DELIMITER //
CREATE PROCEDURE nombre_procedimiento(
  [IN|OUT|INOUT] param1 TIPO,
  [IN|OUT|INOUT] param2 TIPO,
  …
)
BEGIN
  DECLARE var_local TIPO;
  -- Lógica SQL, condicionales, bucles, SIGNAL, etc.
END;
//
DELIMITER ;
```

* **`CALL nombre_procedimiento(arg1, arg2, …);`** para invocarlo.
* **`SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mensaje';`**: generar error personalizado.
* **`IF … THEN … ELSE … END IF;`** dentro de procedimientos.

### 9.8 Triggers

```sql
DELIMITER //
CREATE TRIGGER nombre_trigger
[BEFORE | AFTER] [INSERT | UPDATE | DELETE] ON tabla
FOR EACH ROW
BEGIN
  -- En un INSERT, usar NEW.columna; en un DELETE, usar OLD.columna
  INSERT INTO tabla_auditoria(
    operacion,
    campo1, campo2, …,
    fecha_hora, usuario
  )
  VALUES(
    'INSERT', NEW.campo1, NEW.campo2, …, NOW(), CURRENT_USER()
  );
END;
//
DELIMITER ;
```

* **`FOR EACH ROW`**: se ejecuta por cada fila afectada.
* `NEW.columna` o `OLD.columna` hacen referencia a los valores nuevos o viejos.
* **Eliminar trigger**:

  ```sql
  DROP TRIGGER IF EXISTS nombre_trigger;
  ```

---

## 10. Buenas Prácticas y Consejos Finales

1. **Nombres descriptivos**:

   * Tablas (`clientes`, `productos`, `ventas`, `estudiantes`, `cursos`, `matriculas`)
   * Índices (`idx_nombreTabla_campo`, `idx_compuesto_tabla_campo1_campo2`)
   * Vistas (`vista_ventas`, `vista_matriculas_completas`, `resumen_matriculas`)
   * Funciones (`calcular_total`, `total_creditos_estudiante`, `promedio_creditos_por_anio`)
   * Procedimientos (`resumen_cliente`, `cursos_por_profesor`, `inscribir_estudiante`)
   * Triggers (`after_insert_matricula`).

2. **Consistencia en convenciones**:

   * Usar `snake_case` o `camelCase` para todo de forma uniforme.
   * Añadir prefijos: `idx_` para índices, `vista_` para vistas, `sp_` o `proc_` para procedimientos, `fn_` para funciones (opcional pero ayuda a identificar el objeto).

3. **Verificación de índices**:

   * Siempre probar con `EXPLAIN` las consultas más críticas para confirmar que usan índices.
   * Eliminar índices que no se usan (impactan negativamente en el `INSERT`/`UPDATE`).

4. **Optimización de consultas**:

   * Preferir `JOIN` a subconsultas cuando se trata de multiplicar tablas grandes.
   * Evitar funciones en la cláusula `WHERE` sobre columnas indexadas (p. ej., mejor `WHERE fecha BETWEEN …`).
   * Para rangos de fecha, usar `fecha BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'`.

5. **Uso de vistas**:

   * Crear cuando se repitan consultas complejas de `JOIN` o agregaciones.
   * No abusar de vistas anidadas en vistas (puede penalizar rendimiento en MySQL).

6. **Control de errores en procedimientos**:

   * Comprobar existencia de registros antes de insertar o actualizar.
   * Usar `SIGNAL` para mensajes claros al usuario/DBA.

7. **Triggers**:

   * Solo cuando la lógica de auditoría debe ser “invisible” para la capa de aplicación.
   * Tener cuidado con el rendimiento: cada `INSERT` en la tabla base dispara el código del trigger.

8. **Validaciones**:

   * Si la base de datos debe garantizar unicidad en un par de columnas (p.ej., `matriculas(estudiante_id, curso_id)`), además de índice compuesto, crear una **clave única**:

     ```sql
     ALTER TABLE matriculas
     ADD CONSTRAINT unique_est_curso UNIQUE (estudiante_id, curso_id);
     ```
   * Esto complementa la verificación lógica en el procedimiento.

9. **Uso de Docker (Simulacro 2 y 3)**:

   * Crear un `docker-compose.yml` con servicios `mysql_container` y `adminer_container`.
   * Dentro de `/docker-init`, colocar `init.sql` con la creación de esquemas y datos iniciales.
   * Levantar contenedores con `docker compose up -d` y acceder con:

     ```bash
     docker exec -it mysql_container mysql -u root -p
     ```

---

## 11. Puntos Clave para Memorizar

1. **Sintaxis básica**: `CREATE TABLE`, `CREATE INDEX`, `CREATE VIEW`, `CREATE FUNCTION`, `CREATE PROCEDURE`, `CREATE TRIGGER`.
2. **Claves foráneas**: `FOREIGN KEY (col) REFERENCES otra_tabla(col_pk)`.
3. **Índices**: cuándo usarlos, verificación con `EXPLAIN` y `SHOW INDEX`.
4. **JOIN vs Subconsulta**: preferir `JOIN` para consultas frecuentes y grandes tablas.
5. **Funciones agregadas y `GROUP BY`**:

   * `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`.
   * `GROUP BY` + `HAVING` para filtrar resultados agregados.
6. **Condicionales en SELECT**: `IF(cond, true_val, false_val)` o `CASE`.
7. **Funciones almacenadas**:

   * Sintaxis básica con `DELIMITER`.
   * Declarar `DETERMINISTIC` si aplica.
   * Uso de variables locales (`DECLARE var TIPO; SELECT … INTO var;`).
8. **Procedimientos**:

   * Parámetros `IN`, `OUT`, `INOUT`.
   * Bloques `BEGIN … END`.
   * Manejo de errores con `SIGNAL SQLSTATE '45000'`.
9. **Triggers**:

   * Eventos `BEFORE` / `AFTER INSERT/UPDATE/DELETE`.
   * Referencia a `NEW` y `OLD`.
   * Insertar en tabla de auditoría.
10. **Vistas**:

    * Sintaxis `CREATE VIEW nombre AS SELECT …`.
    * Las vistas en MySQL no son materializadas; cada `SELECT` las recalcula en tiempo real.
11. **Buenas prácticas en consultas**:

    * Evitar funciones en columnas indexadas en `WHERE` (p.ej., mejor `WHERE fecha BETWEEN …`).
    * Usar explícitamente `JOIN … ON …` para mayor legibilidad y mantenimiento.
12. **Gestión de Docker y Adminer** (Simulacros 2 y 3):

    * Archivo `docker-compose.yml` con servicios `mysql_container` y `adminer_container` en la misma red.
    * Credenciales: usuario `root` (o `bae` en el ejemplo) y contraseña `bae`.
    * Iniciar con `docker compose up -d` y ejecutar scripts de inicialización (`init.sql`) al arrancar.

---

## 12. Ejercicios de Práctica Sugeridos

1. **Crear índices adicionales** según patrones reales de consulta, probando con `EXPLAIN`.
2. **Diseñar nuevas vistas** que combinen información de varias tablas con filtros predefinidos.
3. **Implementar procedimientos que modifiquen datos** con validaciones complejas (ej. baja de curso, cambio de apellido de estudiante).
4. **Escribir funciones que utilicen subconsultas** para devolver valores agregados o calculados.
5. **Crear triggers `BEFORE UPDATE` o `BEFORE DELETE`** para auditar o validar condiciones antes de modificar datos.
6. **Probar inserciones de datos erróneas** para entender mejor las restricciones de clave foránea y crear mensajes de error claros en procedimientos.

---

## 13. Conclusión

Con estos apuntes tienes un **resumen estructurado** de todo lo trabajado en los tres simulacros:

1. **Esquemas** de tablas y relaciones en “TecnoMarket” y “Universidad”.
2. **Consultas básicas** (SELECT simples) y **avanzadas** (JOIN, subconsultas, agregaciones, condicionales).
3. **Índices** (simples y compuestos) y su impacto en rendimiento.
4. **Vistas** para encapsular lógica compleja de `JOIN` y cálculos.
5. **Funciones almacenadas** para cálculos de totales y promedios.
6. **Procedimientos almacenados** con validaciones y manejo de errores.
7. **Triggers de auditoría** para registrar operaciones en tiempo real.

Memoriza la **sintaxis** de cada bloque (`CREATE …`, `DROP …`, `SELECT`, `INSERT`, `JOIN`, `GROUP BY`, `IF/CASE`, `SIGNAL`, `NEW/OLD` en triggers, etc.) y practica con ejemplos reales para afianzar conceptos. ¡Éxito en el estudio y en los exámenes!
