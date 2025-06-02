/* Parte 6: Índices
Crear un índice en la columna fecha de la tabla matriculas.*/
CREATE INDEX idx_fecha ON matriculas (fecha);


--Crear un índice compuesto en la tabla matriculas sobre estudiante_id y curso_id.
CREATE INDEX idx_curso_especial ON matriculas(estudiante_id, curso_id);

--Consultar los índices de la tabla matriculas.
SHOW INDEX FROM matriculas;

--Eliminar ambos índices.
DROP INDEX idx_fecha ON matriculas;
