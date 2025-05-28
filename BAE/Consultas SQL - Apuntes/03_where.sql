-- WHERE Nos retorna los datos que cumplen con el criterio pedido en WHERE, en este caso es Madrid
SELECT * FROM cliente WHERE ciudad = 'Madrid'; 



--En este pedimos los clientes donde los puntos de fidelidad sean mayor de 500
SELECT * FROM cliente WHERE puntos_fidelidad >500;

--Aquí pedimos lo mismo, pero solo quiero que aparezcan el nombre y el primer apellido en el resultado
SELECT nombre, apellido1 FROM cliente WHERE puntos_fidelidad >500;



--MAS EJEMPLOS 

-- IN
--Usamos el IN cuando queremos filtrar varios datos, además de () 
SELECT * FROM cliente WHERE ciudad IN ('Madrid','Barcelona');
SELECT * FROM cliente WHERE nombre IN ('Carlos','Ana'); 
SELECT * FROM cliente WHERE apellido1 IN ('Martínez','López','Romero');


/*Aquí empezamos a aplicar lo aprendido anteriormente,
pido que no se repita el id de cliente ni de empleado 
y me diga quienes han hecho una compra mayor a 500*/
SELECT DISTINCT id_cliente, id_empleado FROM venta WHERE total > 500; 




--EN estas consultas seleccionamos datos no repetidos de ventas con fecha de 2023*/
SELECT DISTINCT id_cliente, id_empleado FROM venta WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31' ;
SELECT DISTINCT id, fecha, total FROM venta WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';
SELECT DISTINCT fecha, total FROM venta WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';      

--Sin DISTINCT 
SELECT fecha, total FROM venta WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';   
SELECT id, fecha, total FROM venta WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';
