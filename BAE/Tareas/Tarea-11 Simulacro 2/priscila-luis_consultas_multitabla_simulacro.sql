```sql
-- 1. Consultas Básicas (8 consultas - 1.6 puntos)
-- Listar todos los libros disponibles

SELECT * FROM libro;     
    ```  


-- Mostrar socios de Madrid ordenados por apellido




-- Libros publicados después de 1950

-- Bibliotecarios con más de 3 años de antigüedad

-- Préstamos realizados en 2023

-- Socios sin segundo apellido

-- Libros del género "Realismo mágico"

-- Préstamos no devueltos (fecha_devolucion IS NULL)



-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (sin JOIN)

-- Libros prestados a socios de Barcelona (sin JOIN)

-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)

-- Bibliotecarios que han gestionado préstamos (sin JOIN)

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)

-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)

-- Libros más prestados (sin JOIN)

-- Autores cuyos libros han sido prestados (sin JOIN)



-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (JOIN)

-- Libros prestados a socios de Barcelona (JOIN)

-- Socios que han tomado prestado "Cien años de soledad" (JOIN)

-- Bibliotecarios que han gestionado préstamos (JOIN)

-- Préstamos con datos completos (socio, libro, bibliotecario)

-- Socios con sus préstamos activos (JOIN)

-- Libros nunca prestados (LEFT JOIN)

-- Autores con número de libros prestados (JOIN + GROUP BY)




-- 4. Consultas Resumen (8 consultas - 2.4 puntos)
-- Número de socios por ciudad

-- Promedio de antigüedad de bibliotecarios

-- Cantidad de préstamos por mes en 2023

-- Libros más populares (por veces prestados)

-- Socios más activos (por préstamos realizados)

-- Porcentaje de libros disponibles

-- Días promedio de préstamo

-- Número de préstamos por categoría de socio





-- 5. Subconsultas (8 consultas - 1.2 puntos)

-- Socios que han prestado libros de Gabriel García Márquez

-- Libros con préstamos superiores al promedio

-- Socios con todos los préstamos devueltos a tiempo

-- Bibliotecarios que no han gestionado préstamos

-- Socios que han prestado más libros que el promedio

-- Libros disponibles que nunca han sido prestados

-- Socios con préstamos en todas las categorías de libros

-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid
     
 ```  
