# Resumen Unidades 2, 3 y 4 – Modelado Entidad-Relación, Transformación a Relacional y Normalización

> **Autor:** *Tu Nombre*  
> **Asignatura:** Bases de Datos (BAE)  
> **Unidad 2, 3 y 4 – Tema 1: Diagramas, Entidad-Relación y Normalización**  
> **Formato:** Markdown para VS Code / GitHub  

---

## Tabla de Contenidos

1. [Unidad 2 – Modelado Entidad–Relación (ER)](#unidad-2--modelado-entidadrelación-er)  
   1. [Conceptos Básicos](#21-conceptos-básicos)  
   2. [Entidades y Atributos](#22-entidades-y-atributos)  
   3. [Tipos de Relaciones y Cardinalidades](#23-tipos-de-relaciones-y-cardinalidades)  
   4. [Entidades Débiles y Especialización/Generalización](#24-entidades-débiles-y-especializacióngeneralización)  
   5. [Diagramas ER: Símbolos y Notación](#25-diagramas-er-símbolos-y-notación)  
   6. [Reglas de Diseño ER](#26-reglas-de-diseño-er)  
   7. [Repaso de Relaciones (REPASO-RELACIONES.md)](#27-repaso-de-relaciones-repaso-relacionesmd)  
2. [Unidad 3 – Transformación ER → Modelo Relacional](#unidad-3--transformación-er--modelo-relacional)  
   1. [Del Diagrama ER al Esquema Relacional](#31-del-diagrama-er-al-esquema-relacional)  
   2. [Mapeo de Entidades a Tablas](#32-mapeo-de-entidades-a-tablas)  
   3. [Mapeo de Relaciones 1:1, 1:N y M:N](#33-mapeo-de-relaciones-11-1n-y-mn)  
   4. [Atributos Multivaluados y Compuestos](#34-atributos-multivaluados-y-compuestos)  
   5. [Entidades Débiles en Relacional](#35-entidades-débiles-en-relacional)  
   6. [Ejemplos Prácticos y Reglas](#36-ejemplos-prácticos-y-reglas)  
3. [Unidad 4 – Normalización (REPASO.md)](#unidad-4--normalización-repasomd)  
   1. [Objetivos de la Normalización](#41-objetivos-de-la-normalización)  
   2. [Forma Normal 1 (1FN)](#42-forma-normal-1-1fn)  
   3. [Forma Normal 2 (2FN)](#43-forma-normal-2-2fn)  
   4. [Forma Normal 3 (3FN)](#44-forma-normal-3-3fn)  
   5. [Forma de Boyce–Codd (BCNF)](#45-forma-de-boycecodd-bcnf)  
   6. [Dependencias Funcionales](#46-dependencias-funcionales)  
   7. [Descomposición y Dependencia Transitiva](#47-descomposición-y-dependencia-transitiva)  
   8. [Ejemplos y Proceso de Normalización](#48-ejemplos-y-proceso-de-normalización)  

---

## Unidad 2 – Modelado Entidad–Relación (ER)

La Unidad 2 tiene como objetivo enseñar a representar la realidad del dominio mediante diagramas Entidad–Relación. Incluye desde conceptos básicos hasta notaciones estándar.

### 2.1 Conceptos Básicos

- **Datos versus Información**  
  - *Dato*: hecho aislado (e.g., “1234”).  
  - *Información*: datos organizados con contexto (e.g., “El estudiante Juan Pérez, matrícula 1234, estudia DAW”).

- **Modelado Conceptual**  
  - Proceso de abstraer la realidad para representarla en un modelo (independiente de SGBD).  
  - El modelo ER es **independiente** de la implementación (no SQL ni tablas aún).

- **Objetivo de ER**  
  - Capturar entidades (cosas del mundo real), sus propiedades y las relaciones entre ellas.  
  - Facilitar la transición a un diseño lógico (modelo relacional).

### 2.2 Entidades y Atributos

1. **Entidad**  
   - Representa un “objeto” o “concepto” distinguible en el mundo real (e.g., Cliente, Empleado, Curso).  
   - **Instancias**: valores concretos de esa entidad (e.g., Cliente Pedro García).  

2. **Tipos de Entidad**  
   - **Entidad Fuerte** (o Simple): independiente, tiene clave primaria propia (e.g., Empleado).  
   - **Entidad Débil** (o Dependiente): su existencia depende de otra entidad (e.g., Factura depende de Cliente).  

3. **Atributo**  
   - Propiedad o característica de una entidad (e.g., Nombre, Fecha de Nacimiento).  
   - **Atributo Simple**: indivisible (e.g., DNI).  
   - **Atributo Compuesto**: formado por subatributos (e.g., Dirección → Calle, Ciudad, CP).  
   - **Atributo Multivaluado**: puede tener múltiples valores para una entidad (e.g., Teléfonos de un Cliente).  
   - **Atributo Derivado**: se puede calcular de otros datos (e.g., Edad a partir de Fecha de Nacimiento).  

4. **Clave Primaria**  
   - Atributo (o conjunto) que identifica unívocamente cada instancia.  
   - Se dibuja como *subrayado* en el diagrama ER.  

5. **Clave Alternativa / Única**  
   - Atributo o combinación de atributos distintos de la PK que también identifican unívocamente (e.g., Email en alumnos).  
   - Se suele dibujar con un *subrayado punteado* o notación UML de <<unique>>.  

### 2.3 Tipos de Relaciones y Cardinalidades

1. **Relación**  
   - Asocia instancias de una o varias entidades (e.g., “Empleado trabaja en Departamento”).  
   - Representada con un **rombo** o una línea etiquetada si no se detallan atributos de la relación.  

2. **Grado de la Relación**  
   - **Binaria**: entre dos entidades (mayoría de casos).  
   - **Ternaria o N-aria**: involucra 3 o más entidades (usas si no se puede descomponer en binarias).  

3. **Cardinalidades**  
   - **1:1** (Uno a Uno)  
     - Una instancia de A se relaciona como máximo con una inst. de B, y viceversa.  
     - Ejemplo: “Persona ↔ DNI”.  
   - **1:N** (Uno a Muchos)  
     - Una instancia de A puede relacionarse con varias de B, pero cada B solo con un A.  
     - Ejemplo: “Departamento 1:N Empleado”.  
   - **M:N** (Muchos a Muchos)  
     - Instancias de A pueden vincularse a varias de B, y viceversa.  
     - Ejemplo: “Alumno M:N Curso” (un alumno cursa muchos cursos; un curso tiene muchos alumnos).  

4. **Participación**  
   - **Total** (o Obligatoriedad): todos los A deben participar en la relación (dibujado con línea doble).  
   - **Parcial**: no todas las instancias deben participar (línea simple).  

5. **Cardinalidad Min–Max** (notación opcional)  
   - Escribimos (min, max) junto a cada extremo:  
     - Ej: (0,N) – (1,1) indica que B puede no participar y A participa exactamente con 1…  
   - Más expresivo que solo 1:N.

### 2.4 Entidades Débiles y Especialización/Generalización

1. **Entidad Débil**  
   - No tiene clave propia; su PK incluye la PK de la entidad fuerte de la que depende.  
   - Se dibuja con un **doble rectángulo** y la relación con un **doble rombo**.  
   - Ej: Factura (débil) depende de Cliente (fuerte).  

2. **Identificador Parcial**  
   - Atributo que identifica débilmente solo dentro del contexto de su entidad fuerte, a veces llamado “discriminador”.

3. **Especialización / Generalización**  
   - **Generalización**: agrupar entidades con propiedades comunes en una entidad padre (superclase).  
   - **Especialización**: derivar subclases de una superclase para atributos o comportamientos específicos.  
   - **Herencia**: subclases heredan atributos y relaciones de la superclase.  
   - **Discriminador**: atributo en la superclase que indica a qué subclase pertenece la inst. (e.g., TipoEmpleado = “Temporal” o “Fijo”).  
   - Notación: triángulo con línea desde superclase a subclases.  
   - Participación:  
     - **Total** (símbolo de doble línea): todas las instancias de la superclase deben pertenecer a alguna subclase.  
     - **Parcial** (línea simple): no todas deben.

### 2.5 Diagramas ER: Símbolos y Notación

- **Rectángulo** → Entidad  
- **Óvalo** → Atributo  
  - Subrayado → Clave primaria  
  - Ovalo doble → Atributo multivaluado  
  - Óvalo punteado → Atributo derivado  
  - Atributo compuesto → óvalos conectados en árbol  
- **Rombo** → Relación  
  - Conector de línea con los rectángulos de las entidades involucradas  
  - Se puede escribir el nombre de la relación dentro del rombo  
- **Conector de Línea** → Indica asociatividad y participación (simple/doble)  
- **Doble rectángulo / doble rombo** → Entidad débil y relación identificadora  
- **Triángulo** → Especialización / Generalización  
- **Cardinalidades** (1, N, M, 0…N) junto a las líneas  

> **Notación UML (opcional)**  
> - Clase = Entidad  
> - Atributos y métodos listados dentro del rectángulo particionado  
> - Asociaciones con multiplicidades (0..1, 1..*, etc.)  

### 2.6 Reglas de Diseño ER

1. Cada entidad debe tener una clave primaria.  
2. Evitar redundancia de atributos: si algo se repite en varias entidades, tal vez sea una entidad aparte.  
3. Para relaciones M:N, crear una nueva entidad asociativa si la relación tiene atributos propios.  
4. Nombrar entidades en singular (Cliente, Empleado, Curso).  
5. Usar convenciones de mayúsculas/minúsculas consistentes.  

### 2.7 Repaso de Relaciones (REPASO-RELACIONES.md)

El archivo `REPASO-RELACIONES.md` cubre sintaxis y ejemplos concretos:

- **Tipos de JOIN (INNER, LEFT, RIGHT, FULL, CROSS)**  
- **Escritura SQL “implícita”** (comas en FROM + condiciones en WHERE) versus “explícita” (JOIN … ON …).  
- Ejemplos de SELECT sobre múltiples tablas con diferentes combinaciones (e.g., M:N con tabla intermedia).  
- Reglas de integridad referencial: al añadir clave foránea, verificar existencia de la PK en la tabla padre.

---

## Unidad 3 – Transformación ER → Modelo Relacional

Una vez diseñado el diagrama ER, se transforma en tablas relacionales para implementarlo en SQL. Esta Unidad explica cómo mapear cada componente ER en tablas y restricciones.

### 3.1 Del Diagrama ER al Esquema Relacional

- **Esquema Relacional**:  
  - Conjunto de *relaciones* (tablas) con sus *atributos* y *restricciones*.  
  - Cada tabla corresponde a una entidad o a una relación M:N (entidad asociativa).  

- **Pasos Generales** (ver también ejemplos en los apuntes):
  1. **Entidades Fuertes** → Una tabla por entidad, con todos sus atributos.  
  2. **Entidades Débiles** → Una tabla que incluye la clave foránea de la entidad fuerte + su identificador parcial.  
  3. **Relaciones 1:1** → O bien combinar atributos en la misma tabla (si la obligatoriedad lo permite) o crear una tabla aparte con claves de ambas entidades.  
  4. **Relaciones 1:N** → Incluir la clave primaria de la tabla del lado “1” como **clave foránea** en la tabla del lado “N”.  
  5. **Relaciones M:N** → Crear una **tabla intermedia** (entidad asociativa) que contenga las claves primarias de ambas entidades.  
  6. **Atributos Multivaluados** → Crear una tabla aparte para el atributo multivaluado con su clave foránea a la entidad y el valor del atributo.  
  7. **Atributos Compuestos** → O bien separar en varios campos atómicos o mantener la jerarquía para claridad conceptual, pero al final en Relacional solo campos atómicos.  

### 3.2 Mapeo de Entidades a Tablas

1. **Entidad “Empleado”** con atributos `(id, nombre, apellido, fecha_nacimiento, salario)`:  
   ```sql
   CREATE TABLE Empleado (
     id                INT          PRIMARY KEY,
     nombre            VARCHAR(50)  NOT NULL,
     apellido          VARCHAR(50)  NOT NULL,
     fecha_nacimiento  DATE,
     salario           DECIMAL(10,2)
   );
