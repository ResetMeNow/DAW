--IMIT lo usamos para definir límites 
SELECT * FROM cliente limit 3;



SELECT total, fecha, id
FROM venta
ORDER BY total DESC
LIMIT 5;




SELECT total, fecha
FROM venta
WHERE fecha NOT LIKE '2023%'
ORDER BY total DESC
LIMIT 1;



