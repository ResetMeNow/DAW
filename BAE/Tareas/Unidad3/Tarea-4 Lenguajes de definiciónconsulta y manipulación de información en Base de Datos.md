# <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/> Code, Learn & Practice(Base de datos (Trabajo con funciones en BBDD")
## Objetivo
### Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos.

## Descripción
## Pasos:
### Paso 1: Creación de la BBDD
**Crea con el siguente contenido el fichero supermercado-dump.sql.**

    CREATE TABLE productos (
      id INTEGER PRIMARY KEY,
      nombre TEXT,
      categoria TEXT,
      precio REAL
    );

    CREATE TABLE ventas (
      id INTEGER PRIMARY KEY,
      id_producto INTEGER,
      cantidad INTEGER,
      fecha DATE,
      FOREIGN KEY (id_producto) REFERENCES productos(id)
    );

    INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

    INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
 ![image](https://github.com/user-attachments/assets/a24e6c1a-a5fa-4ca8-8f9c-98f7a15d4b0f)

## Paso 2 Lectura del fichero sql.
**Entra en sqlite a través del siguiente comando:**

    sqlite3 tarea4.db  

Haciendo un .read del fichero sql, de nombre supermercado-db.sql, realiza la creación e inserción de información de la BBDD.
![image](https://github.com/user-attachments/assets/092b1994-087b-4d17-825e-e50ef8e0b76b)

## Paso 3: Responde a las siguientes cuestiones
- Realiza el diagrama ER de la BBDD supermercado.
- Realiza el diagrama MR de la BBDD supermercado.
- Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.

## Paso 4: Responde a las siguientes cuestiones
Realiza las siguientes consultas, y muestra el resultado obtenido:

- Mostrar todos los productos de la categoría "Bebidas".
- Listar los productos ordenados por precio de forma descendente.
- Calcular el precio total de todos los productos en la tabla "productos".
- Encontrar los productos con un nombre que contenga la letra 'a'.
- ![image](https://github.com/user-attachments/assets/48013880-015d-405f-9f76-6306f84e626d)

- Obtener la cantidad total de productos vendidos en todas las fechas.
- Encontrar el producto más caro en cada categoría.
- Listar los productos que no han sido vendidos.
- Calcular el precio promedio de los productos en la categoría "Snacks".
- Encontrar los productos que han sido vendidos más de 5 veces.
- Mostrar la fecha y la cantidad de ventas para cada producto.
- ![image](https://github.com/user-attachments/assets/f5d6b697-e170-4b23-8d8a-b687076c12b3)

- Encontrar los productos que tienen un precio menor o igual a 2.
- Calcular la cantidad total de ventas para cada fecha.
- Listar los productos cuyo nombre comienza con la letra 'P'.
- Obtener el producto más vendido en términos de cantidad.
- Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
- Calcular el total de ventas para cada producto.
- Encontrar los productos con un precio entre 3 y 4.
- ![image](https://github.com/user-attachments/assets/65d2b153-89ad-4f47-a217-4a3f664daada)

- Listar los productos y sus categorías ordenados alfabéticamente por categoría.
- Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
- Mostrar los productos que no pertenecen a la categoría "Higiene".
- ![image](https://github.com/user-attachments/assets/527f2c8f-d1f1-4518-b2e9-ef53bad5cafe)

- Encontrar la cantidad total de productos en cada categoría.
- Listar los productos que tienen un precio igual a la media de precios.
- Calcular el precio total de los productos vendidos en cada fecha.
- Mostrar los productos con un nombre que termina con la letra 'o'.
- Encontrar los productos que han sido vendidos en más de una fecha.
- Listar los productos cuya categoría comienza con la letra 'L'.
- Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
- ![image](https://github.com/user-attachments/assets/47f3f392-4c16-4ab2-9b5f-284421a16a8e)

- Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
- Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".
- ![image](https://github.com/user-attachments/assets/f871ea24-e287-4b7a-82d5-aac24a829110)

 
## Generación Informe
Genera un informe con cada una de las consultas y los resuldos obtenidos tras su ejecución. El informe se debe de realizar en markdown, y enviar el enlace.
