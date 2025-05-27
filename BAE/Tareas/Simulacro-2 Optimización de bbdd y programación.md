# Code, Learn & Practice("Simulacro de bbdd 🧪: Consultas, Índices, Vistas, Funciones y Procedimientos")

---

## 🧾 Contexto
Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas. Además, deberás demostrar habilidades en consultas SQL, índices, vistas, procedimientos y funciones. Si la base de datos no estuvira creada, a continuación tienes el init.sql. [link](https://github.com/jpexposito/code-learn-practice/blob/main/primero/bae/unidad-7/simulacros/simulacro2/docker-init/init.sql)

# 🔎 Parte 1: Consultas SQL

## A. Consultas Simples


### 1. Mostrar todos los cursos disponibles

```sql
SELECT * 
  FROM cursos;
```

### 2. Mostrar el nombre de todos los profesores

```sql
SELECT nombre
  FROM profesores;
```
### 3. Listar todas las matrículas
```sql

SELECT *
  FROM matriculas;
```
### 4. Ver los nombres y correos de los estudiantes
 ```sql
SELECT nombre, email
  FROM estudiantes;
```
5. Ver los cursos y su número de créditos
```sql
SELECT nombre, creditos
  FROM cursos;
```

## B. Consultas con WHERE. Obligatorio utilizar WHERE donde se combine dos o más tablas

### 1. Obtener los cursos impartidos por profesores del departamento de Informática

```sql
SELECT c.*
  FROM cursos c
  JOIN profesores p
    ON c.profesor_id = p.id
 WHERE p.departamento = 'Informática';
```

### 2. Obtener los estudiantes que viven en Madrid
```sql
SELECT *
  FROM estudiantes
 WHERE ciudad = 'Madrid';
```
### 3. Mostrar los cursos con más de 5 créditos
 ```sql
SELECT *
  FROM cursos
 WHERE creditos > 5;
```

### 4. Ver las matrículas realizadas después del año 2022

```sql
SELECT *
  FROM matriculas
 WHERE fecha > '2022-12-31';
```

### 5. Ver los cursos impartidos por la profesora “Dra. Ana Torres”

```sql
SELECT c.*
  FROM cursos c
  JOIN profesores p
    ON c.profesor_id = p.id
 WHERE p.nombre = 'Dra. Ana Torres';
```
## C. Consultas con JOIN. Obligatorio utilizar JOIN donde se combine dos o más tablas
> (Devuelven el mismo resultado que las anteriores, pero usando combinaciones de tablas)

### 1. Mostrar cursos impartidos por profesores del departamento de Informática

```sql
SELECT c.*
  FROM cursos c
  JOIN profesores p
    ON c.profesor_id = p.id
 WHERE p.departamento = 'Informática';


