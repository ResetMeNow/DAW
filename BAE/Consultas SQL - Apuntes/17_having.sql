
--HAVING
/*La cláusula HAVING en SQL se utiliza para filtrar los resultados de una consulta 
que ha sido agrupada utilizando la cláusula GROUP BY. Funciona similar a la cláusula WHERE, 
pero para grupos en lugar de registros individuales. Especifica una condición de búsqueda 
que debe cumplirse para cada grupo, permitiendo que solo se muestren los grupos que satisfacen esa condición.

En resumen: HAVING filtra grupos de datos después de haber sido agrupados por la cláusula GROUP BY, 
basándose en funciones agregadas (como SUM(), AVG(), COUNT(), etc.). */
SELECT COUNT(comision) FROM empleado HAVING comision > 0.10;
+-----------------+
| COUNT(comision) |
+-----------------+
| 8               |
+-----------------+