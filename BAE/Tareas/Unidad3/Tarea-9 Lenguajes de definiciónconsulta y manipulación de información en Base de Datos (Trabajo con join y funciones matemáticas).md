 # <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/> Code, Learn & Practice(Base de datos (Trabajo con join y funciones matemáticas")
# Descripción
En la siguiente tarea se premia el uso de funciones matemáticas, así como la utilización de join en BBDD.

Realiza la lectura de la base de datos a través del fichero base datos de clientes.
 <details>
 <summary>Tablas de datos realizada aquí.</summary>

```sql
sqlite> .mode table
sqlite> .tables
Alumnos        Clases         Inscripciones
sqlite> SELECT * from clases;
+----+------------------------+-------------+------------+
| id |         nombre         |   materia   |  profesor  |
+----+------------------------+-------------+------------+
| 1  | Matemáticas 101        | Matemáticas | Profesor X |
| 2  | Historia Antigua       | Historia    | Profesor Y |
| 3  | Literatura Moderna     | Literatura  | Profesor Z |
| 4  | Biología Avanzada      | Biología    | Profesor W |
| 5  | Química Orgánica       | Química     | Profesor V |
| 6  | Física Cuántica        | Física      | Profesor U |
| 7  | Arte Contemporáneo     | Arte        | Profesor T |
| 8  | Inglés Avanzado        | Idiomas     | Profesor S |
| 9  | Economía Internacional | Economía    | Profesor R |
| 10 | Derecho Penal          | Derecho     | Profesor Q |
+----+------------------------+-------------+------------+
sqlite> SELECT * from Alumnos;
+----+--------+------+-----------+
| id | nombre | edad | direccion |
+----+--------+------+-----------+
| 1  | Juan   | 20   | Calle A   |
| 2  | María  | 21   | Calle B   |
| 3  | Pedro  | 19   | Calle C   |
| 4  | Laura  | 22   | Calle D   |
| 5  | Carlos | 20   | Calle E   |
| 6  | Ana    | 19   | Calle F   |
| 7  | Sofía  | 21   | Calle G   |
| 8  | Diego  | 20   | Calle H   |
| 9  | Lucía  | 22   | Calle I   |
| 10 | Miguel | 19   | Calle J   |
+----+--------+------+-----------+
sqlite> SELECT * from Inscripciones;
+----+-----------+----------+
| id | id_alumno | id_clase |
+----+-----------+----------+
| 1  | 1         | 1        |
| 2  | 1         | 2        |
| 3  | 2         | 3        |
| 4  | 2         | 4        |
| 5  | 3         | 5        |
| 6  | 3         | 6        |
| 7  | 4         | 7        |
| 8  | 4         | 8        |
| 9  | 5         | 9        |
| 10 | 6         | 10       |
+----+-----------+----------+
sqlite>
```

 </details>
    
Realiza el listado de consultas que se encuentran en el fichero consultas-bd.
 <details>
 <summary>Soluciones aquí.</summary>
  
```sql

1 - Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
SELECT a.nombre AS alumno, c.nombre AS clase
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

2 - Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
SELECT a.nombre AS alumno, c.materia
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

3 - Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.edad, c.profesor
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

4 - Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

--IMPORTANTE-- Las clases no tienen dirección, asi qué puse la dirección de los alumnos.
SELECT a.nombre AS alumno, a.direccion
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id;

5 - Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
SELECT a.nombre AS alumno, c.nombre AS clase, c.profesor
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

6 - Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, c.materia, c.profesor
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

7 - Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.edad, c.materia
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

8 - Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
SELECT a.nombre AS alumno, a.direccion, c.profesor
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id;

9 - Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
SELECT a.nombre AS alumno, c.materia
FROM Inscripciones i
JOIN Alumnos a ON i.id_alumno = a.id
JOIN Clases c ON i.id_clase = c.id
ORDER BY a.nombre;

10 - Contar cuántos alumnos están inscritos en cada clase.
SELECT c.nombre AS clase, COUNT(i.id_alumno) AS total_alumnos
FROM Clases c
LEFT JOIN Inscripciones i ON c.id = i.id_clase
GROUP BY c.id, c.nombre;


```
 </details>
