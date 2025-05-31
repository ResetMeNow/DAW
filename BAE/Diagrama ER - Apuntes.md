
  # 🌟 Modelado ER, Transformación Relacional y Normalización

---

## 📑 Contenidos

 [Unidad 2 – Modelado Entidad–Relación (ER)](#unidad-2––modelado-entidadrelación-er)  
   1. [🔍 Conceptos Básicos](#21-🔍-conceptos-básicos)  
   2. [🏷 Entidades y Atributos](#22-🏷 entidades-y-atributos)  
   3. [🔗 Relaciones y Cardinalidades](#23-🔗 relaciones-y-cardinalidades)  
   4. [⚡ Entidades Débiles y Especialización](#24-⚡ entidades-débiles-y-especialización)  
   5. [🎨 Símbolos y Notación ER](#25-🎨 símbolos-y-notación-er)  
   6. [✅ Reglas de Diseño ER](#26-✅ reglas-de-diseño-er)  
   7. [📝 Repaso de Relaciones (REPASO-RELACIONES.md)](#27-📝 repaso-de-relaciones-repaso-relacionesmd)

[Unidad 3 – Transformación ER → Modelo Relacional](#unidad-3––transformación-er-→-modelo-relacional)  
   1. [🔄 Paso a Esquema Relacional](#31-🔄 paso-a-esquema-relacional)  
   2. [📋 Mapeo de Entidades a Tablas](#32-📋 mapeo-de-entidades-a-tablas)  
   3. [🔄 Mapeo de Relaciones 1:1, 1:N y M:N](#33-🔄 mapeo-de-relaciones-11-1n-y-mn)  
   4. [🔄 Atributos Multivaluados y Compuestos](#34-🔄 atributos-multivaluados-y-compuestos)  
   5. [🔗 Entidades Débiles en Relacional](#35-🔗 entidades-débiles-en-relacional)  
   6. [💡 Ejemplos Prácticos y Reglas](#36-💡 ejemplos-prácticos-y-reglas)

[Unidad 4 – Normalización (REPASO.md)](#unidad-4––normalización-repasomd)  
   1. [🎯 Objetivos de la Normalización](#41-🎯 objetivos-de-la-normalización)  
   2. [🕹️ Forma Normal 1 (1FN)](#42-🕹️ forma-normal-1-1fn)  
   3. [⚙️ Forma Normal 2 (2FN)](#43-⚙️ forma-normal-2-2fn)  
   4. [🔒 Forma Normal 3 (3FN)](#44-🔒 forma-normal-3-3fn)  
   5. [🏆 BCNF (Boyce–Codd)](#45-🏆 bcnf-boycecodd)  
   6. [🔄 Dependencias Funcionales](#46-🔄 dependencias-funcionales)  
   7. [🧩 Descomposición y Dependencia Transitiva](#47-🧩 descomposición-y-dependencia-transitiva)  
   8. [📈 Ejemplos y Proceso de Normalización](#48-📈 ejemplos-y-proceso-de-normalización)

---

## Unidad 2 – Modelado Entidad–Relación (ER)

> **Objetivo:** Representar la realidad del dominio con diagramas ER, para luego llevarlo a un modelo lógico/relacional.

---

### 2.1 🔍 Conceptos Básicos

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

### 2.2 🏷 Entidades y Atributos

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

### 2.3 🔗 Relaciones y Cardinalidades

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

### 2.4 ⚡ Entidades Débiles y Especialización

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

### 2.5 🎨 Símbolos y Notación ER

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

### 2.6 ✅ Reglas de Diseño ER

1. **Cada entidad** debe tener una **clave primaria** clara.  
2. **Evitar redundancia** de atributos; si se repite información, seguramente necesites otra entidad.  
3. **Relaciones M:N** con atributos → convertir en **entidad asociativa** con su propia tabla.  
4. **Nombres consistentes**: Entidades en **singular** (Cliente, Empleado), atributos en **minúsculas** o **camelCase**.  
5. **Participación y cardinalidad** deben reflejar requisitos reales del dominio.  
6. **Verificar** que ningún atributo quede huérfano sin ser representado.

---

### 2.7 📝 Repaso de Relaciones (REPASO-RELACIONES.md)

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

## Unidad 3 – Transformación ER → Modelo Relacional

> **Objetivo:** Convertir el diagrama ER en un conjunto de tablas relacionales, listo para implementarse en SQL.

---

### 3.1 🔄 Paso a Esquema Relacional

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

### 3.2 📋 Mapeo de Entidades a Tablas

1. **Empleado** *(entidad fuerte)*  
   ```sql
   CREATE TABLE Empleado (
     id                INT          PRIMARY KEY,
     nombre            VARCHAR(50)  NOT NULL,
     apellido          VARCHAR(50)  NOT NULL,
     fecha_nacimiento  DATE,
     salario           DECIMAL(10,2)
   );
