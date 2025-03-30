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
    
```sql

-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
     ** Mostrar modelo, precio y cliente de cada coche vendido usando JOIN entre las tres tablas.**
SELECT 
    c.modelo,
    c.marca,
    c.precio,
    cl.nombre AS cliente
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente;



-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
SELECT DISTINCT cl.nombre
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente
WHERE c.precio > (SELECT AVG(precio) FROM coches WHERE id_coche IN (SELECT id_coche FROM ventas));



-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
SELECT modelo, precio
FROM coches
WHERE id_coche NOT IN (SELECT id_coche FROM ventas);


-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
SELECT SUM(c.precio) AS total_ventas
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche;


-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
    ** Debo mostrar coches vendidos con fecha y cliente, ordenados por fecha descendente. Solo un campo de ordenación.**
SELECT 
    c.modelo,
    c.marca,
    v.fecha_venta,
    cl.nombre AS cliente
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente
ORDER BY v.fecha_venta DESC;


-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX 
    **Busco el modelo con mayor precio. Tengo que usar MAX.**
SELECT modelo, precio
FROM coches
WHERE precio = (SELECT MAX(precio) FROM coches) LIMIT 1;


-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
 ** Tengo que usar COUNT teniendo en cuenta el cliente el cual haya comprado al menos uno.
 Agrupé por cliente y filtré con HAVING COUNT >= 1.**
SELECT 
    cl.nombre,
    COUNT(v.id_venta) AS cantidad_coches
FROM clientes cl
JOIN ventas v ON cl.id_cliente = v.id_cliente
GROUP BY cl.id_cliente, cl.nombre
HAVING COUNT(v.id_venta) >= 1;

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
    ** No necesitas LIKE ni regexp porque no se repite, es una búsqueda concreta.
 Sí está normalizada, Toyota solo existe en coches y no se repite en otras tablas.**
SELECT DISTINCT cl.nombre
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente
WHERE c.marca = 'Toyota';

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
** Está pidiendo el promedio de edad el promedio de edad AVG de clientes que compraron coches de mas de 25000.
 Primero filtro esas ventas, luego calculo la media de edad de esos clientes.**
SELECT AVG(cl.edad) AS promedio_edad
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente
WHERE c.precio > 25000;


-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
** Filtré clientes con edad >30 y mostré los modelos y precios de lo que compraron.
Se necesita unir las tres tablas para obtener esta información.**
SELECT DISTINCT c.modelo, c.precio
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
JOIN clientes cl ON v.id_cliente = cl.id_cliente
WHERE cl.edad > 30;


-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
 ** Me pide los vendidos en el 2022 pero no hubieron ventas ese año, no devuelve nada en la consulta. **
SELECT 
    c.modelo,
    c.marca,
    COUNT(*) AS total_ventas_2022
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
WHERE strftime('%Y', v.fecha_venta) = '2022'
GROUP BY c.modelo, c.marca;


-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG  
** Una lista de coches cuyos precios son mayores al promedio de vendidos en menores de 30 años**
SELECT c.modelo, c.marca, c.año, c.precio
FROM coches c
WHERE c.precio > (
    SELECT AVG(co.precio)
    FROM ventas v
    JOIN clientes cl ON v.id_cliente = cl.id_cliente
    JOIN coches co ON v.id_coche = co.id_coche
    WHERE cl.edad < 30
);


-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
** Agrupé por marcas, sume sus venta y ordené de mayor a menor.
Me pide saber el total de las ventas por marca de coche.**
SELECT 
    c.marca,
    SUM(c.precio) AS total_ventas
FROM ventas v
JOIN coches c ON v.id_coche = c.id_coche
GROUP BY c.marca
ORDER BY total_ventas DESC;

```

     
 </details>
