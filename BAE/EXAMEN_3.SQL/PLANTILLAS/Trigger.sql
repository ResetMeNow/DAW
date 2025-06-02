--Creamos el Trigger

CREATE TABLE auditoria_nombre_pedido(
    operacion VARCHAR (10)
    nombre_id INT,
    nombre2_id INT
    fecha_hora DATETIME,
    usuario VARCHAR (100)
);




--AFTER INSERT

DELIMITER //
CREATE TRIGGER after_inser_nombreQUEpide
AFTER INSERT ON matriculas
FOR EACH ROW
BEGIN
  INSERT INTO auditoria_nombre_pedido (operacion, nombre_id, nombre2_id, fecha_hora, usuario)
  VALUES ('INSERT', NEW.nombre_id, NEW.nombre2_id, NOW(), CURRENT_USER());
END;
//
DELIMITER;





--CONSULTAR REGISTROS
SELECT * FROM auditoria_nombre_pedido;

--ELIMINAR 
DROP TRIGGER IF EXISTS after_insert_nombreQUEpide;
DROP TABLE IF EXISTS auditoria_nombre_pedido;