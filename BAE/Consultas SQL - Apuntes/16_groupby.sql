--GROUP BY
--Agrupamos por ciudad aquí
SELECT * FROM cliente GROUP BY ciudad;
+----+--------+-----------+-----------+-----------+------------------+
| id | nombre | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+--------+-----------+-----------+-----------+------------------+
| 2  | Ana    | López     | Fernández | Barcelona | 800              |
| 6  | Laura  | Jiménez   | Moreno    | Bilbao    | 950              |
| 1  | Carlos | Martínez  | García    | Madrid    | 1500             |
| 8  | Javier | Domingo   | Santos    | Málaga    | 600              |
| 4  | Elena  | Gómez     |           | Sevilla   | 1200             |
| 3  | Miguel | Sánchez   | Díaz      | Valencia  |                  |
| 7  | Sofía  | Hernández |           | Zaragoza  | 1800             |
+----+--------+-----------+-----------+-----------+------------------+

SELECT MAX(puntos_fidelidad) FROM cliente GROUP BY puntos_fidelidad;
+-----------------------+
|                       |
| 400                   |
| 600                   |
| 750                   |
| 800                   |
| 950                   |
| 1100                  |
| 1200                  |
| 1500                  |
| 1800                  |
+-----------------------+

SELECT COUNT(puntos_fidelidad) 
FROM cliente 
GROUP BY puntos_fidelidad
ORDER BY puntos_fidelidad DESC;
+-------------------------+
| COUNT(puntos_fidelidad) |
+-------------------------+
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 1                       |
| 0                       |
+-------------------------+