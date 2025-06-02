⚙ /*Parte 3: Procedimiento Almacenado
Crear un procedimiento llamado inscribir_estudiante que reciba:
ID del estudiante
ID del curso
Fecha de inscripción
El procedimiento debe:
Verificar que el estudiante no esté ya matriculado en ese curso.
Si no lo está, insertarlo en matriculas; si ya lo está, lanzar un error.*/


--Ejecutar el procedimiento para inscribir al estudiante con ID 1 en el curso con ID 2.


--Debe de salir el ERROR y en caso de no tener el error no hacer nada.

--Eliminar el procedimiento.



🪞/*Parte 4: Vistas
Crear una vista llamada resumen_matriculas que muestre:
Nombre del estudiante
Nombre del curso
Nombre del profesor
Fecha de matrícula*/
CREATE VIEW resumen_matriculas AS 
SELECT e.nombre AS estudiante, c.nombre AS curso, p.nombre AS profesor, m.fecha
FROM matricula m 
JOIN estudiante e ON m.id_estudiante = e.id
JOIN curso c ON m.id_curso = c.id
JOIN profesor p ON p.profesor = p.id;



--Consultar los datos desde la vista, mostrando nombre del estudiante y curso.
SELECT estudiante, curso FROM resumen_matriculas;

--Eliminar la vista.
DROP VIEW IF EXISTS resumen_matriculas;

🧮 /*Parte 5: Función Definida por el Usuario
Crear una función llamada promedio_creditos_por_anio que reciba un año como parámetro y 
devuelva el promedio de créditos matriculados por estudiante ese año.*/
DELIMITER//
CREATE FUNCTION promedio_creditos_por_anio (anio INT)
RETURNS DECIMAL (5,2)
DETERMINISTIC
BEGIN 
            DECLARE promedio DECIMAL (5,2);
            SELECT AVG (c.creditos) INTO promedio
            FROM matricula m 
            JOIN curso c ON m.curso_id = c.id
            WHERE YEAR(m.fecha) = anio;
            RETURN promedio;

END;
//
DELIMITER;

--Ejecutar la función para el año 2023.
SELECT promedio_creditos_por_anio (2023);

--Eliminar la función.
DROP FUNCTION IF EXISTS promedio_creditos_por_anio;



📂 /*Parte 6: Índices
Crear un índice en la columna fecha de la tabla matriculas.*/
CREATE INDEX idx_fecha ON matriculas (fecha);

--Crear un índice compuesto en la tabla matriculas sobre estudiante_id y curso_id.
CREATE INDEX idx_curso1 ON matriculas (estudiante_id, curso_id);

--Consultar los índices de la tabla matriculas.
SHOW INDEX FROM matriculas;

--Eliminar ambos índices.
DROP INDEX idx_fecha ON matriculas;
DROP INDEX IF EXISTS idx_curso1 ON matriculas;


🕵️ /*Parte 7: Trigger de Auditoría
Crear una tabla llamada auditoria_matriculas que registre:
Tipo de operación (INSERT)
ID del estudiante
ID del curso
Fecha y hora de la operación
Usuario que realizó la acción*/
CREATE TABLE auditoria_matriculas(
    operacion VARCHAR (10),
    curso_id INT,
    estudiante_id INT,
    fecha_hora DATETIME,
    usuario VARCHAR (100)
);

/*Crear un trigger AFTER INSERT sobre matriculas que inserte un registro en auditoria_matriculas al realizar una matrícula.*/
DELIMITER//
CREATE TRIGGER after_insert_matriculas
AFTER INSERT ON matriculas
FOR EACH ROW 
BEGIN 
           INSERT INTO auditoria_matriculas(operacion, curso_id, estudiante_id, fecha_hora, usuario)
           VALUES ('INSERT', NEW.id_estudiante, NEW.id_curso, NOW(), CURRENT_USER());

END;
//
DELIMITER;

--Consultar los registros de la auditoría.
SELECT * FROM auditoria_matriculas;

--Eliminar el trigger y la tabla de auditoría.
DROP TABLE IF EXISTS auditoria_matriculas;
DROP TRIGGER IF EXISTS after_insert_matriculas;
