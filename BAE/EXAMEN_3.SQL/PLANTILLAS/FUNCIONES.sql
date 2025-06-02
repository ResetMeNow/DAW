
--Crear una función llamada promedio_creditos_por_anio que reciba un año como parámetro y 
--devuelva el promedio de créditos matriculados por estudiante ese año.
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
DELIMITER;




-- Ejecutar la función para el año 2023.
SELECT FUNCTION promedio_creditos_por_anio (2023);



--Eliminar la función.
DROP FUNCTION IF EXISTS promedio_creditos_por_anio;