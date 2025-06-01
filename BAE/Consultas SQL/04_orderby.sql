-- ORDER BY nos sirve para ordenar
SELECT * FROM venta ORDER BY fecha; --Nos ordena la fecha de compra


--ASC o DESC
SELECT * FROM venta ORDER BY id_cliente DESC; --De mayor a menor
SELECT * FROM venta ORDER BY id_empleado ASC; --De menor a mayor
   
   -- ASC o DESC con WHERE
   SELECT * FROM cliente WHERE ciudad = 'Madrid' ORDER BY nombre;
   /*Las personas de Madrid apareceran por orden alfabético, 
   si le ponemos DESC aparecen por orden alfabético invertido*/


--Los clientes con puntos de fidelidad menor a 800 por orden alfabético
SELECT * FROM cliente WHERE puntos_fidelidad <=800  ORDER BY nombre; 


/*Empezamos a hacer consultas mas complejas, aquí escogemos los datos queremos mostrar (id, nombre, puntos) 
donde los puntos sean menor o igual a 800 y los ordenamos por orden descendente*/
SELECT nombre, puntos_fidelidad 
FROM cliente 
WHERE puntos_fidelidad <=800
ORDER BY ciudad DESC; 


--Escogemos los datos que piden de la tabla empleado donde la comision es mayor a 0,08 y lo ordemanos de mayor a menor DESC
SELECT nombre, apellido1, comision 
FROM empleado 
WHERE comision > 0.08 
ORDER BY comision DESC;

