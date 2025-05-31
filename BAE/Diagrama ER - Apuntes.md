
  # 🌟 Modelado ER, Transformación Relacional y Normalización

---

## 📑 Contenidos

 ### Modelado Entidad–Relación (ER)
   1. [🔍 Conceptos Básicos](#21-🔍conceptos-básicos)  
   2. [🏷 Entidades y Atributos](#22-🏷entidades-y-atributos)  
   3. [🔗 Relaciones y Cardinalidades](#23-🔗relaciones-y-cardinalidades)  
   4. [⚡ Entidades Débiles y Especialización](#24-⚡entidades-débiles-y-especialización)  
   5. [🎨 Símbolos y Notación ER](#25-🎨símbolos-y-notación-er)  
   6. [✅ Reglas de Diseño ER](#26-✅reglas-de-diseño-er)  
   7. [📝 Repaso de Relaciones (REPASO-RELACIONES.md)](#27-📝repaso-de-relaciones-repaso-relacionesmd)

### Transformación ER → Modelo Relacional
   1. [🔄 Paso a Esquema Relacional](#31-🔄paso-a-esquema-relacional)  
   2. [📋 Mapeo de Entidades a Tablas](#32-📋mapeo-de-entidades-a-tablas)  
   3. [🔄 Mapeo de Relaciones 1:1, 1:N y M:N](#33-🔄mapeo-de-relaciones-11-1n-y-mn)  
   4. [🔄 Atributos Multivaluados y Compuestos](#34-🔄atributos-multivaluados-y-compuestos)  
   5. [🔗 Entidades Débiles en Relacional](#35-🔗entidades-débiles-en-relacional)  
   6. [💡 Ejemplos Prácticos y Reglas](#36-💡ejemplos-prácticos-y-reglas)

### Normalización
   1. [🎯 Objetivos de la Normalización](#41-🎯objetivos-de-la-normalización)  
   2. [🕹️ Forma Normal 1 (1FN)](#42-🕹️forma-normal-1-1fn)  
   3. [⚙️ Forma Normal 2 (2FN)](#43-⚙️forma-normal-2-2fn)  
   4. [🔒 Forma Normal 3 (3FN)](#44-🔒forma-normal-3-3fn)  
   5. [🏆 BCNF (Boyce–Codd)](#45-🏆bcnf-boycecodd)  
   6. [🔄 Dependencias Funcionales](#46-🔄dependencias-funcionales)  
   7. [🧩 Descomposición y Dependencia Transitiva](#47-🧩descomposición-y-dependencia-transitiva)  
   8. [📈 Ejemplos y Proceso de Normalización](#48-📈ejemplos-y-proceso-de-normalización)

---

## Unidad – Modelado Entidad–Relación (ER)

> **Objetivo:** Representar la realidad del dominio con diagramas ER, para luego llevarlo a un modelo lógico/relacional.

---

### 1 🔍 Conceptos Básicos

- **Dato vs Información**  
  - **Dato**: Hecho aislado (ej. “1234”).  
  - **Información**: Datos organizados con contexto (ej. “Estudiante Juan Pérez, matrícula 1234, estudia DAW”).

- **Modelado Conceptual**  
  - Abstrae la realidad para describir entidades, atributos y relaciones.  
  - Es independiente del SGBD y de la implementación final.

- **Modelo ER**  
  - Conjunto de **entidades**, **atributos** y **relaciones**.  
  - Sirve como base para el diseño relacional y la creación de tablas.

---

### 2 🏷 Entidades y Atributos

| Concepto          | Descripción                                                                                                 |
|-------------------|-------------------------------------------------------------------------------------------------------------|
| **Entidad**       | Objeto/cosa distinguible del mundo real (Cliente, Empleado, Curso).                                        |
| **Instancia**     | Ejemplo concreto de una entidad (Cliente “Pedro García”).                                                   |
| **Entidad Fuerte**| Tiene existencia independiente y clave primaria propia.                                                    |
| **Entidad Débil** | Depende de otra entidad para existir; clave primaria parcial + clave foránea (ej. Factura depende de Cliente). |
| **Atributo**      | Propiedad de una entidad (Nombre, FechaNacimiento).                                                         |
| **Simple**        | Indivisible (ej. DNI).                                                                                      |
| **Compuesto**     | Descomponible en subatributos (Dirección → Calle, Ciudad, CP).                                             |
| **Multivaluado**  | Puede tener múltiples valores (Teléfonos de Cliente).                                                       |
| **Derivado**      | Calculable a partir de otros (Edad a partir de FechaNacimiento).                                           |
| **Clave primaria**| Atributo(s) que identifican únic. cada instancia; se subraya en ER.                                         |
| **Clave única**   | Atributo distinto de la PK que también identifica de forma única (ej. Email).                              |

---

### 3 🔗 Relaciones y Cardinalidades

- **Relación**: Asociación lógica entre entidades (ej. “Empleado trabaja en Departamento”).  
- **Grado**: Número de entidades involucradas:  
  - **Binaria**: 2 entidades (lo más común).  
  - **Ternaria** o **N-aria**: 3 o más entidades.

- **Tipos de Cardinalidad**:

  | Tipo  | Significado                                                                                                         | Notación            |
  |-------|---------------------------------------------------------------------------------------------------------------------|---------------------|
  | **1:1**   | Cada A se relaciona con **una** B, y cada B con **una** A.                                                         | `1—1`               |
  | **1:N**   | Una A puede relacionarse con *varias* B, pero cada B solo con *una* A.                                           | `1—N`               |
  | **M:N**   | Una A puede relacionarse con varias B, y una B con varias A (se descompone en tabla asociativa al transformar). | `M—N`               |

- **Participación**:  
  - **Total** (obligatoria): *Todas* las instancias de A deben participar en la relación.  
  - **Parcial**: No es obligatorio que todas participen.  

- **Notación Min–Max** (opcional, más expresiva):  
  - Escribimos `(min,max)` junto a cada extremo para describir con precisión.  
  - Ejemplo:
    ```
    Empleado —(0,N)— Proyecto —(1,1)— Cliente
    ```

---

### 4 ⚡ Entidades Débiles y Especialización

1. **Entidad Débil**  
   - No tiene PK propia; PK = (PK_entidad_fuerte, identificador_parcial).  
   - Se dibuja con **doble rectángulo**, y su relación con un **doble rombo**.  
   - Ejemplo:  
     ```
     Cliente 📦—(Doble Rombo)→ Factura 📦(Débil)
     ```

2. **Entidades Especializadas / Generalizadas**  
   - **Generalización**: Agrupa atributos comunes en la superclase.  
   - **Especialización**: Crea subclases (herencia).  
   - **Discriminator (D)**: Atributo en la superclase que indica la subclase (ej. TipoEmpleado).  
   - **Participación**:  
     - **Total** (doble línea al triángulo): Todas las instancias de la superclase pertenecen a alguna subclase.  
     - **Parcial** (línea simple al triángulo): Solo algunas pertenecen.  

   **Ejemplo de Notación**:

   <div align="center">
   **Persona**  
   ▪ id (PK)  
   ▪ nombre  
   ▪ tipo (Discriminator: “Cliente” / “Empleado”)  
   △ (Generalización / Especialización)  
   /       \
   PersonaCliente   PersonaEmpleado  
   ▪ id (FK)       ▪ id (FK)  
   ▪ puntos        ▪ salario  
   ▪ ciudad        ▪ departamento  
   </div>

---

### 5 🎨 Símbolos y Notación ER

| Símbolo                         | Representa                           |
|---------------------------------|---------------------------------------|
| <span style="font-size:1.2em;">⬛</span> Rectángulo       | **Entidad**                         |
| <span style="font-size:1.2em;">➰</span> Óvalo           | **Atributo**                        |
| <span style="font-size:1.2em;">🔷</span> Rombo            | **Relación**                        |
| <span style="font-size:1.2em;">🖇️</span> Línea           | **Asociación / Conector**          |
| <span style="font-size:1.2em;">🔲🔲</span> Doble rectángulo | **Entidad Débil**                   |
| <span style="font-size:1.2em;">🔶🔶</span> Doble rombo      | **Relación Identificadora**         |
| <span style="font-size:1.2em;">▲</span> Triángulo         | **Especialización / Generalización** |
| <span style="font-size:0.8em;">—1</span> Línea simple con `1`  | Participación mínima 1, lado único   |
| <span style="font-size:0.8em;">—N</span> Línea simple con `N`  | Participación muchos, lado múltiple  |
| <span style="font-size:0.8em;">=</span> Línea doble        | Participación total / obligatoria    |

- **Atributo Subrayado**: Clave primaria.  
- **Óvalo Doble**: Atributo multivaluado.  
- **Óvalo Punteado**: Atributo derivado.  
- **Atributo Compuesto**: Con varios sub-óvalos conectados.

---

### 6 ✅ Reglas de Diseño ER

1. **Cada entidad** debe tener una **clave primaria** clara.  
2. **Evitar redundancia** de atributos; si se repite información, seguramente necesites otra entidad.  
3. **Relaciones M:N** con atributos → convertir en **entidad asociativa** con su propia tabla.  
4. **Nombres consistentes**: Entidades en **singular** (Cliente, Empleado), atributos en **minúsculas** o **camelCase**.  
5. **Participación y cardinalidad** deben reflejar requisitos reales del dominio.  
6. **Verificar** que ningún atributo quede huérfano sin ser representado.

---

### 7 📝 Repaso de Relaciones (REPASO-RELACIONES)

Este apartado amplía el uso de SQL para combinar tablas, centrado en:

- **JOINs**  
  - `INNER JOIN`: devuelve solo filas coincidentes.  
  - `LEFT JOIN`: devuelve todas las filas de la izquierda y las coincidentes de la derecha (NULL si no coincide).  
  - `RIGHT JOIN`: (MySQL, Oracle) similar a LEFT pero inverso.  
  - `FULL OUTER JOIN`: filas de ambas tablas, rellenando con NULL donde no haya coincidencias.  
  - `CROSS JOIN`: producto cartesiano (todas las combinaciones posibles).

- **SQL “implícito” vs “explícito”**  
  - *Implícito*:  
    ```sql
    SELECT * 
      FROM A, B 
     WHERE A.id = B.id;
    ```  
  - *Explícito*:  
    ```sql
    SELECT * 
      FROM A 
    INNER JOIN B ON A.id = B.id;
    ```

- **Restricciones y integridad referencial**  
  - `FOREIGN KEY(valor) REFERENCES OTRA_TABLA(clave)`  
  - Enlaces que garantizan que el valor de la FK exista en la tabla padre.  

---

## Unidad – Transformación ER → Modelo Relacional

> **Objetivo:** Convertir el diagrama ER en un conjunto de tablas relacionales, listo para implementarse en SQL.

---

### 1 🔄 Paso a Esquema Relacional

**Esquema Relacional**: Conjunto de tablas(tuplas) + sus atributos + restricciones (PK, FK, UNIQUE).  
***Pasos Generales***:  
  1. **Entidades Fuertes** → crear una tabla por entidad con todos sus atributos.  
  2. **Entidades Débiles** → tabla con PK compuesta (PK_de_entidad_fuerte + identificador_parcial) + FK.  
  3. **Relaciones 1:1** → incluir la PK de un lado como FK en la otra, o crear tabla adicional para la relación.  
  4. **Relaciones 1:N** → incluir PK_del_1 como FK en tabla_del_N.  
  5. **Relaciones M:N** → crear tabla intermedia (entidad asociativa) con PK compuesta de ambas PK, más FK.  
  6. **Atributos Multivaluados** → tabla aparte con FK a la entidad y valor.  
  7. **Atributos Compuestos** → descomponer en columnas atómicas en la tabla.

---

### 2 📋 Mapeo de Entidades a Tablas

1. **Empleado** *(entidad fuerte)*  
   ```sql
   CREATE TABLE Empleado (
     id                INT          PRIMARY KEY,
     nombre            VARCHAR(50)  NOT NULL,
     apellido          VARCHAR(50)  NOT NULL,
     fecha_nacimiento  DATE,
     salario           DECIMAL(10,2)
   );

````markdown
### 3.2 📋 Mapeo de Entidades a Tablas

#### 2. Cliente (Entidad Fuerte)

```sql
CREATE TABLE Cliente (
  id                INT         PRIMARY KEY,
  nombre            VARCHAR(50) NOT NULL,
  apellido1         VARCHAR(50) NOT NULL,
  apellido2         VARCHAR(50),
  ciudad            VARCHAR(50),
  puntos_fidelidad  INT
);
````

* **Explicación**:

  * Creamos la tabla `Cliente` con sus atributos atómicos.
  * `id` es la clave primaria.
  * `apellido2` y demás campos pueden admitir valores NULL si no se especifica NOT NULL.

---

#### 3. Factura (Entidad Débil)

```sql
CREATE TABLE Factura (
  cliente_id INT,
  numero     INT,
  fecha      DATE,
  PRIMARY KEY (cliente_id, numero),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);
```

* **Explicación**:

  * `Factura` es una **entidad débil**, por eso su PK está compuesta de `cliente_id` (FK) y `numero` (identificador parcial).
  * La restricción `FOREIGN KEY` asegura integridad referencial con `Cliente`.

---

### 3.3 🔄 Mapeo de Relaciones 1:1, 1\:N y M\:N

| Tipo de Relación | Descripción y Ejemplo Relacional                                                                                                                                                                                                                                                                                                                                                                                                          |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1:1**          | Si ambas participaciones son totales, pueden unirse en una sola tabla.<br>Si una es opcional, incluir la FK del lado opcional con `UNIQUE`.                                                                                                                                                                                                                                                                                               |
| **Ejemplo 1:1**  | `sql<br>CREATE TABLE Departamento (  <br>  id INT PRIMARY KEY,  <br>  nombre VARCHAR(50),  <br>  director_id INT UNIQUE,  <br>  FOREIGN KEY (director_id) REFERENCES Empleado(id)<br>);`                                                                                                                                                                                                                                                  |
| **1\:N**         | Incluir la PK de “lado 1” como FK en la tabla del “lado N”.                                                                                                                                                                                                                                                                                                                                                                               |
| **Ejemplo 1\:N** | `sql<br>ALTER TABLE Empleado<br>  ADD COLUMN departamento_id INT,<br>  ADD FOREIGN KEY (departamento_id) REFERENCES Departamento(id);`                                                                                                                                                                                                                                                                                                    |
| **M\:N**         | Crear una tabla intermedia con las PKs de ambas entidades como PK compuesta + FKs.                                                                                                                                                                                                                                                                                                                                                        |
| **Ejemplo M\:N** | `sql<br>CREATE TABLE Alumno (  <br>  id INT PRIMARY KEY,  <br>  nombre VARCHAR(50)  <br>);  <br>CREATE TABLE Curso (  <br>  id INT PRIMARY KEY,  <br>  nombre VARCHAR(50)  <br>);  <br>CREATE TABLE Matricula (  <br>  alumno_id INT,  <br>  curso_id INT,  <br>  fecha DATE,  <br>  PRIMARY KEY (alumno_id, curso_id),  <br>  FOREIGN KEY (alumno_id) REFERENCES Alumno(id),  <br>  FOREIGN KEY (curso_id) REFERENCES Curso(id)  <br>);` |

---

### 3.4 🔄 Atributos Multivaluados y Compuestos

#### Atributos Multivaluados (Ej. Teléfonos de Cliente)

```sql
CREATE TABLE TelefonoCliente (
  cliente_id INT,
  telefono   VARCHAR(15),
  PRIMARY KEY (cliente_id, telefono),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);
```

* **Explicación**:

  * Cada fila almacena un número de teléfono asociado a un cliente.
  * La PK compuesta evita duplicados del mismo número para un cliente específico.

---

#### Atributos Compuestos (Ej. Dirección)

Aunque en ER se dibuje como compuesto, en relacional se descompone en columnas atómicas:

```sql
CREATE TABLE Direccion (
  id     INT PRIMARY KEY,
  calle  VARCHAR(100),
  ciudad VARCHAR(50),
  cp     VARCHAR(10)
);
```

* **Explicación**:

  * `Dirección` se divide en `calle`, `ciudad` y `cp` para cumplir 1FN (valores atómicos).

---

### 3.5 🔗 Entidades Débiles en Relacional

* **Ejemplo Recap**:
  La entidad `Factura` depende de `Cliente`. Ya se creó como:

  ```sql
  CREATE TABLE Factura (
    cliente_id INT,
    numero     INT,
    fecha      DATE,
    PRIMARY KEY (cliente_id, numero),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
  );
  ```

* **Explicación**:

  * La PK incluye la FK hacia `Cliente`.
  * Si `Cliente` se borra, todas sus facturas deben gestionarse según la política referencial (CASCADE, RESTRICT…).

---

### 3.6 💡 Ejemplos Prácticos y Reglas

1. **Transformar una Relación M\:N con Atributos**

   * Si la relación tiene atributos propios, la tabla intermedia también los incluirá.
   * Ejemplo: `Matricula` con atributo `nota`:

   ```sql
   CREATE TABLE Matricula (
     alumno_id INT,
     curso_id  INT,
     nota      DECIMAL(3,1),
     PRIMARY KEY (alumno_id, curso_id),
     FOREIGN KEY (alumno_id) REFERENCES Alumno(id),
     FOREIGN KEY (curso_id) REFERENCES Curso(id)
   );
   ```

2. **Regla Resumida**

   > Cada **entidad** → **tabla**.
   > Cada **relación M\:N** → **tabla intermedia**.
   > Cada **atributo multivaluado** → **tabla aparte**.
   > Los **atributos compuestos** se fragmentan en columnas atómicas.

---

## Unidad 4 – Normalización (REPASO.md)

> **Meta:** Eliminar redundancias y anomalías de inserción/actualización/borrado, garantizando integridad.

---

### 4.1 🎯 Objetivos de la Normalización

1. **Eliminar Redundancia**: Evitar duplicar datos.
2. **Prevenir Anomalías**:

   * **Inserción**: No requerir datos extra para insertar algo.
   * **Actualización**: No obligar a cambiar el mismo dato en múltiples filas.
   * **Borrado**: No perder información importante al eliminar registros.
3. **Mantener Dependencias Funcionales Claras**: Cada atributo no clave depende de la PK completa.

---

### 4.2 🕹️ Forma Normal 1 (1FN)

* **Definición**:

  1. Todos los atributos son **atómicos** (sin grupos repetitivos ni multivaluados).
  2. Cada celda tiene un único valor.

* **Eliminar Atributos Multivaluados**:

  * Crear tabla separada para cada atributo multivaluado (ej. `TelefonoCliente`).

* **Descomponer Atributos Compuestos**:

  * Separar en columnas atómicas (ej. `calle`, `ciudad`, `cp`).

---

### 4.3 ⚙️ Forma Normal 2 (2FN)

* **Definición**:

  1. La tabla está en **1FN**.
  2. **Ningún atributo no clave** depende solo de **parte** de la PK si ésta es compuesta.

* **Detectar Violaciones**:

  * Si la PK = `(A,B)` y existe `C` que depende solo de `A`, no de `(A,B)`.

* **Solución**:

  * Descomponer la tabla en dos, separando esa dependencia parcial:

  **Antes (1FN):**

  ```
  MATRICULA (alumno_id, curso_id, curso_nombre, nota)
  ```

  **Violación**: `curso_nombre` depende solo de `curso_id`.
  **En 2FN:**

  ```sql
  CREATE TABLE Curso (
    curso_id      INT PRIMARY KEY,
    curso_nombre  VARCHAR(100)
  );
  CREATE TABLE Matricula (
    alumno_id INT,
    curso_id  INT,
    nota      DECIMAL(3,1),
    PRIMARY KEY (alumno_id, curso_id),
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
  );
  ```

---

### 4.4 🔒 Forma Normal 3 (3FN)

* **Definición**:

  1. La tabla está en **2FN**.
  2. **No existe dependencia transitiva** de atributos no clave sobre la PK.

* **Detectar Violaciones**:

  * Si `PK → B` y `B → C`, con `PK` clave primaria y `B`, `C` no claves.

* **Solución**:

  * Descomponer para eliminar la dependencia transitiva.

  **Ejemplo**:

  ```
  EMPLEADO (id, nombre, depto_id, depto_nombre)
  ```

  * `depto_nombre` depende de `depto_id`, no directamente de `id`.
    **En 3FN:**

  ```sql
  CREATE TABLE Departamento (
    depto_id     INT PRIMARY KEY,
    depto_nombre VARCHAR(50)
  );
  CREATE TABLE Empleado (
    id           INT PRIMARY KEY,
    nombre       VARCHAR(50),
    depto_id     INT,
    FOREIGN KEY (depto_id) REFERENCES Departamento(depto_id)
  );
  ```

---

### 4.5 🏆 BCNF (Boyce–Codd)

* **Definición**:

  1. La tabla está en **3FN**.
  2. Para cada dependencia funcional `X → Y`, **X debe ser superclave** (determina toda la fila).

* **Ejemplo de Violación**:

  ```
  HORARIO (profesor_id, hora, aula)
  ```

  * Dependencias:

    * `(profesor_id, hora) → aula`
    * `(aula, hora) → profesor_id`
  * Ninguno de los determinantes `(profesor_id, hora)` ni `(aula, hora)` es superclave total, por lo que viola BCNF.

* **Solución**:

  * Descomponer en tablas más pequeñas que cumplan BCNF.

---

### 4.6 🔄 Dependencias Funcionales

* **Definición**: `X → Y` indica que si dos filas tienen el mismo valor de **X**, necesariamente comparten el valor de **Y**.
* **Clave candidata**: Mínimo conjunto de atributos que determina todos los demás.
* **Clave primaria**: Elegida entre las claves candidatas.
* **Determinante**: Conjunto de atributos en el lado izquierdo de una dependencia funcional.
* **Cerradura (X⁺)**: Conjunto de atributos que se pueden derivar de X usando todas las dependencias funcionales disponibles.

---

### 4.7 🧩 Descomposición y Dependencia Transitiva

* **Descomposición**: Dividir una tabla en varias para eliminar problemas de dependencia.

* **Dependencia Transitiva**:

  * Si `A → B` y `B → C`, entonces `A → C`.
  * Indeseable en 3FN cuando `B` y `C` no son parte de la clave.

* **Propiedades de Descomposición**:

  1. **Sin Pérdida (Lossless-Join)**: Al unir las tablas descompuestas, recuperamos la tabla original sin filas extra.
  2. **Preservación de Dependencias**: Todas las dependencias funcionales originales deben poder comprobarse a partir de las nuevas tablas.

---

### 4.8 📈 Ejemplos y Proceso de Normalización

1. **Ejemplo Completo**

   * **Tabla inicial**:

     ```
     PEDIDO (pedido_id, fecha, cliente_id, cliente_nombre, ciudad, total)
     ```
   * **1FN**:

     * Todos los valores son atómicos (✔).
   * **2FN**:

     * `cliente_nombre` y `ciudad` dependen solo de `cliente_id`, no de `pedido_id`.
     * → Descomponer en:

       ```sql
       CREATE TABLE Cliente (
         cliente_id     INT PRIMARY KEY,
         cliente_nombre VARCHAR(50),
         ciudad         VARCHAR(50)
       );
       CREATE TABLE Pedido (
         pedido_id   INT PRIMARY KEY,
         fecha       DATE,
         cliente_id  INT,
         total       DECIMAL(10,2),
         FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
       );
       ```
   * **3FN**:

     * Después de la descomposición, no existen dependencias transitivas en `Cliente` ni en `Pedido` (✔).
   * **BCNF**:

     * Ambas tablas cumplen que cada determinante es superclave (✔).

2. **Proceso Paso a Paso**

   1. Identificar la **PK** y todas las **dependencias funcionales** (DFs).
   2. Verificar **1FN**: Atributos atómicos.
   3. Verificar **2FN**: Eliminar dependencias parciales → descomponer.
   4. Verificar **3FN**: Eliminar dependencias transitivas → descomponer.
   5. Verificar **BCNF**: Cada `X → Y`, X debe ser superclave; si no, descomponer.

---

```
```
