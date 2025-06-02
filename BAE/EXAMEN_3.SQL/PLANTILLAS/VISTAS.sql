/*Crear una vista llamada resumen_matriculas que muestre:
Nombre del estudiante
Nombre del curso
Nombre del profesor
Fecha de matrícula*/

CREATE VIEW resumen_matriculas AS 
SELECT e.nombre AS estudiante, c.nombre AS curso, p.nombre AS profesor, m.fecha
FROM matricula m
JOIN estudiante e ON m.id_estudiante = e.id
JOIN curso c ON m.id_curso = c.id
JOIN profesor p ON c.profesor_id = p.id;

--Consultar los datos desde la vista, mostrando nombre del estudiante y curso.
SELECT estudiante, curso FROM resumen_matriculas;

--Eliminar la vista.
DROP VIEW IF EXISTS resumen_matriculas;