 # <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/>  Code, Learn & Practice(Base de datos (Trabajo con subconsultas y funciones matemáticas")
# Descripción
***En la siguiente tarea se premia el uso de funciones matemáticas, así como la utilización de subconsultas en BBDD.*** 


### Realiza la lectura de la base de datos a través del fichero base datos de clientes.
 <details>
 <summary>Tarea realizada aquí.</summary>
   <div align="center">
    
```sql

sqlite> .mode table
sqlite> SELECT * FROM Clientes;
+------------+-----------------+------+----------------+
| id_cliente |     nombre      | edad |   direccion    |
+------------+-----------------+------+----------------+
| 1          | Juan Pérez      | 30   | Calle A #123   |
| 2          | María Gómez     | 25   | Avenida B #456 |
| 3          | Carlos López    | 35   | Calle C #789   |
| 4          | Ana Martínez    | 28   | Avenida D #101 |
| 5          | Pedro Rodríguez | 40   | Calle E #234   |
| 6          | Laura Sánchez   | 32   | Avenida F #567 |
| 7          | Miguel González | 27   | Calle G #890   |
| 8          | Isabel Díaz     | 38   | Avenida H #111 |
| 9          | Francisco Ruiz  | 33   | Calle I #222   |
| 10         | Elena Torres    | 29   | Avenida J #333 |
+------------+-----------------+------+----------------+
sqlite> SELECT * FROM coches;
+----------+----------------+------------+------+---------+
| id_coche |     modelo     |   marca    | año  | precio  |
+----------+----------------+------------+------+---------+
| 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 |
| 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 |
| 3        | SUV 2023       | Ford       | 2023 | 30000.0 |
| 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
| 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
| 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
| 9        | Pickup 2022    | Ram        | 2022 | 31000.0 |
| 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
+----------+----------------+------------+------+---------+
sqlite> SELECT * FROM ventas;
+----------+------------+----------+-------------+
| id_venta | id_cliente | id_coche | fecha_venta |
+----------+------------+----------+-------------+
| 1        | 1          | 1        | 2023-01-15  |
| 2        | 2          | 2        | 2023-02-20  |
| 3        | 3          | 3        | 2023-03-25  |
| 4        | 4          | 4        | 2023-04-10  |
| 5        | 5          | 5        | 2023-05-05  |
| 6        | 6          | 6        | 2023-06-15  |
| 7        | 7          | 7        | 2023-07-20  |
| 8        | 8          | 8        | 2023-08-25  |
| 9        | 10         | 10       | 2023-10-05  |
+----------+------------+----------+-------------+
sqlite>

```
     
 </details>

### Realiza el listado de consultas que se encuentran en el fichero consultas-bd.
 <details>
 <summary>Soluciones aquí.</summary>
   <div align="center">
     
</details>
