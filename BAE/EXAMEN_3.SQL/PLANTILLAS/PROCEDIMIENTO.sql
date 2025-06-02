/*Crear un procedimiento llamado inscribir_estudiante que reciba:
ID del estudiante
ID del curso
Fecha de inscripción
El procedimiento debe:
Verificar que el estudiante no esté ya matriculado en ese curso.
Si no lo está, insertarlo en matriculas; si ya lo está, lanzar un error.*/
DELIMITER//
CREATE PROCEDURE inscribir_estudiante (IN id_ins INT, IN id_curso INT, IN fecha DATE)
BEGIN
        DECLARE existe INT;
        SELECT COUNT(*) INTO existe FROM matriculas WHERE id_curso =  id_curso AND id_ins = id_estudiante;
        IF existe = 0 THEN;
        INSERT INTO matriculas (id_estudiante,id_curso, fecha)
        VALUES(id_ins, id_curso, fecha)
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya está matriculado.';
    END IF;
END;
//
DELIMITER 

--El ERROR es opcional, dado que esta parte no la hemos trabajado pero el if si.

--Ejecutar el procedimiento para inscribir al estudiante con ID 1 en el curso con ID 2.
CALL inscribir_estudiante (1,2);
--Debe de salir el ERROR y en caso de no tener el error no hacer nada.

--Eliminar el procedimiento.
DROP PROCEDURE IF EXISTS inscribir_estudiante;

