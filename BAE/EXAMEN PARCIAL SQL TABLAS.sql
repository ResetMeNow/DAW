sqlite> select * from empleado;      
+----+-----------+-----------+-----------+----------+
| id |  nombre   | apellido1 | apellido2 | comision |
+----+-----------+-----------+-----------+----------+
| 1  | Daniel    | Vázquez   | Gil       | 0.12     |
| 2  | María     | Castro    | Ortega    | 0.1      |
| 3  | Pablo     | Molina    | Serrano   | 0.08     |
| 4  | Lucía     | Reyes     | Martín    | 0.11     |
| 5  | Alejandro | Suárez    | Blanco    | 0.09     |
| 6  | Isabel    | Morales   | Iglesias  | 0.1      |
| 7  | Francisco | Santana   | Méndez    | 0.08     |
| 8  | Cristina  | Cabrera   | Flores    | 0.04     |
+----+-----------+-----------+-----------+----------+
sqlite> select * from venta;   
+----+---------+------------+------------+-------------+
| id |  total  |   fecha    | id_cliente | id_empleado |
+----+---------+------------+------------+-------------+
| 1  | 899.99  | 2023-05-15 | 5          | 2           |
| 2  | 1499.5  | 2022-09-20 | 1          | 5           |
| 3  | 450.75  | 2023-05-15 | 2          | 1           |
| 4  | 299.9   | 2022-08-10 | 8          | 3           |
| 5  | 1799.0  | 2023-04-22 | 5          | 2           |
| 6  | 3299.99 | 2022-07-05 | 7          | 1           |
| 7  | 5999.0  | 2021-09-12 | 2          | 1           |
| 8  | 1299.95 | 2023-03-18 | 4          | 6           |
| 9  | 2499.5  | 2022-10-15 | 8          | 3           |
| 10 | 350.25  | 2021-06-30 | 8          | 2           |
| 11 | 199.99  | 2022-08-10 | 3          | 7           |
| 12 | 4199.0  | 2023-02-14 | 2          | 1           |
| 13 | 799.5   | 2023-01-25 | 6          | 1           |
| 14 | 249.9   | 2023-02-02 | 6          | 1           |
| 15 | 899.0   | 2023-03-10 | 1          | 5           |
| 16 | 2799.99 | 2023-03-10 | 1          | 5           |
+----+---------+------------+------------+-------------+
sqlite> select * from cliente; 
+----+----------+-----------+-----------+-----------+------------------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | puntos_fidelidad |
+----+----------+-----------+-----------+-----------+------------------+
| 1  | Carlos   | Martínez  | García    | Madrid    | 1500             |
| 2  | Ana      | López     | Fernández | Barcelona | 800              |
| 3  | Miguel   | Sánchez   | Díaz      | Valencia  |                  |
| 4  | Elena    | Gómez     |           | Sevilla   | 1200             |
| 5  | David    | Pérez     | Ruiz      | Madrid    | 750              |
| 6  | Laura    | Jiménez   | Moreno    | Bilbao    | 950              |
| 7  | Sofía    | Hernández |           | Zaragoza  | 1800             |
| 8  | Javier   | Domingo   | Santos    | Málaga    | 600              |
| 9  | Patricia | Romero    | González  | Barcelona | 1100             |
| 10 | Antonio  | Navarro   | Torres    | Valencia  | 400              |
+----+----------+-----------+-----------+-----------+------------------+
