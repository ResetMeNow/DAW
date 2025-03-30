 # <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/> Code, Learn & Practice(Base de datos (Trabajo con expresiones regulares y funciones matemáticas")
# Descripción
En la siguiente tarea se premia el uso de expresiones regulares en BBDD.

Realiza la lectura de la base de datos a través del fichero base datos de clientes.
 <details>
 <summary>Tarea realizada aquí.</summary>
   <div align="center">
    
```sql 
sqlite> .mode table
sqlite> SELECT * FROM Clientes;
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
sqlite> SELECT * FROM Productos;
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 7  | Cámara Digital                    | 499.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 17 | Lámpara LED                       | 39.99  |
| 18 | Batería Externa                   | 19.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 24 | Soporte para Teléfono             | 14.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |
+----+-----------------------------------+--------+
sqlite> SELECT * FROM Pedidos;
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 1         | 1          | 1           | 2        | 2024-02-01   |
| 2         | 2          | 2           | 1        | 2024-02-02   |
| 3         | 3          | 3           | 3        | 2024-02-03   |
| 4         | 4          | 4           | 1        | 2024-02-04   |
| 5         | 5          | 5           | 2        | 2024-02-05   |
| 6         | 6          | 6           | 1        | 2024-02-06   |
| 7         | 7          | 7           | 3        | 2024-02-07   |
| 8         | 8          | 8           | 2        | 2024-02-08   |
| 9         | 9          | 9           | 1        | 2024-02-09   |
| 10        | 10         | 10          | 2        | 2024-02-10   |
| 11        | 11         | 11          | 1        | 2024-02-11   |
| 12        | 12         | 12          | 3        | 2024-02-12   |
| 13        | 13         | 13          | 1        | 2024-02-13   |
| 14        | 14         | 14          | 2        | 2024-02-14   |
| 15        | 15         | 15          | 1        | 2024-02-15   |
| 16        | 16         | 16          | 3        | 2024-02-16   |
| 17        | 17         | 17          | 2        | 2024-02-17   |
| 18        | 18         | 18          | 1        | 2024-02-18   |
| 19        | 19         | 19          | 2        | 2024-02-19   |
| 20        | 20         | 20          | 1        | 2024-02-20   |
| 21        | 21         | 21          | 3        | 2024-02-21   |
| 22        | 22         | 22          | 1        | 2024-02-22   |
| 23        | 23         | 23          | 2        | 2024-02-23   |
| 24        | 24         | 24          | 1        | 2024-02-24   |
| 25        | 25         | 25          | 3        | 2024-02-25   |
| 26        | 26         | 26          | 2        | 2024-02-26   |
| 27        | 27         | 27          | 1        | 2024-02-27   |
| 28        | 28         | 28          | 2        | 2024-02-28   |
| 29        | 29         | 29          | 1        | 2024-02-29   |
| 30        | 30         | 30          | 3        | 2024-03-01   |
+-----------+------------+-------------+----------+--------------+
sqlite>


```


</details>

Realiza el listado de consultas que se encuentran en el fichero consultas-bd.
 <details>
 <summary>Soluciones aquí.</summary>
   <div align="center">

 ```sql 

-- Obtener todos los clientes.
SELECT * FROM Clientes;

-- Obtener la cantidad total de productos en todos los pedidos
SELECT SUM(cantidad) AS total_productos FROM Pedidos;

-- Obtener el precio promedio de los productos:
SELECT AVG(precio) AS precio_promedio FROM Productos;

-- Obtener los clientes que tienen un email válido (contiene '@'):
SELECT * FROM Clientes WHERE email LIKE '%@%';

-- Obtener el producto más caro.
SELECT * FROM Productos ORDER BY precio DESC LIMIT 1;

-- Obtener los pedidos realizados en febrero de 2024.
SELECT * FROM Pedidos WHERE fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';

-- Obtener la cantidad total de productos en todos los pedidos por producto.
SELECT id_producto, SUM(cantidad) AS total_productos FROM Pedidos GROUP BY id_producto;

-- Obtener los clientes que han realizado más de un pedido.
SELECT id_cliente, COUNT(id_pedido) AS total_pedidos 
FROM Pedidos 
GROUP BY id_cliente;

-- Obtener los productos que tienen un precio registrado.
SELECT * FROM Productos WHERE precio IS NOT NULL;

-- Obtener la fecha del primer pedido realizado:
SELECT MIN(fecha_pedido) AS primer_pedido FROM Pedidos;

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':
SELECT * FROM Productos WHERE nombre LIKE 'A%' OR nombre LIKE 'B%';

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
SELECT id_cliente, SUM(cantidad) AS total_productos FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.
SELECT c.id, c.nombre, c.email, COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.id_cliente
WHERE p.fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY c.id
HAVING COUNT(p.id_pedido) > 1;
<--Solo sale 1 y deberia salir más-->


-- Obtener los productos con precio entre 100 y 500.
SELECT * FROM Productos WHERE precio BETWEEN 100 AND 500;


-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
SELECT id_cliente, SUM(cantidad) AS total_productos FROM Pedidos GROUP BY id_cliente ORDER BY total_productos DESC;

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
SELECT * FROM Clientes WHERE nombre LIKE '%a%' OR nombre LIKE '%A%';

-- Obtener el precio máximo de los productos.
SELECT MAX(precio) AS precio_maximo FROM Productos;

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
SELECT * FROM Pedidos WHERE id_cliente = 1 AND fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
SELECT id_producto, SUM(cantidad) AS total_productos FROM Pedidos GROUP BY id_producto ORDER BY total_productos DESC;

-- Obtener los productos que no tienen un precio registrado.
SELECT * FROM Productos WHERE precio IS NULL;

-- Obtener la fecha del último pedido realizado.
SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos;

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
SELECT * FROM Clientes WHERE LENGTH(nombre) >= 5;

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
SELECT * FROM Productos WHERE nombre LIKE '%o%' OR nombre LIKE '%O%';

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
SELECT id_cliente, SUM(cantidad) AS total_productos FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;

-- Obtener los clientes cuyos nombres no contienen la letra 'i':
SELECT * FROM Clientes WHERE nombre NOT LIKE '%i%' AND nombre NOT LIKE '%I%';
<--No cuenta los acentos-->

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
SELECT * FROM Pedidos WHERE id_cliente = 2 AND fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';

-- Obtener el precio mínimo de los productos.
SELECT MIN(precio) AS precio_minimo FROM Productos;

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
SELECT DISTINCT id_cliente FROM Pedidos WHERE fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos WHERE id_cliente = 3;

-- Obtener los productos que tienen una 'a' al final del nombre.
SELECT * FROM Productos WHERE nombre LIKE '%a' OR nombre LIKE '%A';

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
SELECT * FROM Clientes WHERE LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre, 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) <= LENGTH(nombre) - 4;

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
SELECT * FROM Productos WHERE CAST(precio AS TEXT) LIKE '____.%';

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
SELECT * FROM Clientes WHERE nombre LIKE '%ea%';

-- Obtener los productos cuyos nombres terminan con una consonante.
SELECT * FROM Productos WHERE nombre REGEXP '[^aeiouAEIOU]$';

-- Obtener los productos cuyos nombres empiezan con una vocal.
SELECT * FROM Productos WHERE nombre LIKE 'A%' OR nombre LIKE 'E%' OR nombre LIKE 'I%' OR nombre LIKE 'O%' OR nombre LIKE 'U%';

```
 
  
</details>
