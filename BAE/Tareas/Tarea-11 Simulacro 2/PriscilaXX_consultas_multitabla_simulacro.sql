-- 1. Consultas Básicas (8 consultas - 1.6 puntos)
-- Listar todos los libros disponibles
SELECT * FROM libro;

-- Mostrar socios de Madrid ordenados por apellido
SELECT * FROM socio WHERE ciudad = 'Madrid' ORDER BY apellido1;

-- Libros publicados después de 1950
SELECT * FROM libro WHERE año_publicacion > 1950;

-- Bibliotecarios con más de 3 años de antigüedad
SELECT * FROM bibliotecario WHERE antiguedad > 3;

-- Préstamos realizados en 2023
SELECT * FROM prestamo WHERE fecha_prestamo LIKE '2023-%';

-- Socios sin segundo apellido
SELECT * FROM socio WHERE apellido2 IS NULL;

-- Libros del género "Realismo mágico"
SELECT * FROM libro WHERE genero = 'Realismo mágico';

-- Préstamos no devueltos (fecha_devolucion IS NULL)
SELECT * FROM prestamo WHERE fecha_devolucion IS NULL;

-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (sin JOIN)
SELECT p.*, s.nombre, l.titulo 
FROM prestamo p, socio s, libro l
WHERE p.id_socio = s.id AND p.id_libro = l.id;

-- Libros prestados a socios de Barcelona (sin JOIN)
SELECT l.* 
FROM libro l, prestamo p, socio s
WHERE l.id = p.id_libro AND p.id_socio = s.id AND s.ciudad = 'Barcelona';

-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
SELECT s.* 
FROM socio s, prestamo p, libro l
WHERE s.id = p.id_socio AND p.id_libro = l.id AND l.titulo = 'Cien años de soledad';

-- Bibliotecarios que han gestionado préstamos (sin JOIN):
SELECT DISTINCT b.* 
FROM bibliotecario b, prestamo p
WHERE b.id = p.id_bibliotecario;

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
SELECT * 
FROM prestamo
WHERE fecha_devolucion > date(fecha_prestamo, '+14 days');

-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)
SELECT * 
FROM socio s
WHERE s.id NOT IN (SELECT id_socio FROM prestamo);

-- Libros más prestados (sin JOIN)
SELECT l.titulo, COUNT(p.id) AS veces_prestado
FROM libro l, prestamo p
WHERE l.id = p.id_libro
GROUP BY l.id
ORDER BY veces_prestado DESC;

-- Autores cuyos libros han sido prestados (sin JOIN)
SELECT DISTINCT l.autor
FROM libro l, prestamo p
WHERE l.id = p.id_libro;


-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (JOIN)
SELECT p.*, s.nombre, l.titulo
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id;

-- Libros prestados a socios de Barcelona (JOIN)
SELECT l.*
FROM libro l
JOIN prestamo p ON l.id = p.id_libro
JOIN socio s ON p.id_socio = s.id
WHERE s.ciudad = 'Barcelona';

-- Socios que han tomado prestado "Cien años de soledad" (JOIN)
SELECT s.*
FROM socio s
JOIN prestamo p ON s.id = p.id_socio
JOIN libro l ON p.id_libro = l.id
WHERE l.titulo = 'Cien años de soledad';

-- Bibliotecarios que han gestionado préstamos (JOIN)
SELECT DISTINCT b.*
FROM bibliotecario b
JOIN prestamo p ON b.id = p.id_bibliotecario;

-- Préstamos con datos completos (socio, libro, bibliotecario)
SELECT p.id, s.nombre AS socio, l.titulo, b.nombre AS bibliotecario
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id
JOIN bibliotecario b ON p.id_bibliotecario = b.id;

-- Socios con sus préstamos activos (JOIN)
SELECT s.nombre, s.apellido1, l.titulo
FROM socio s
JOIN prestamo p ON s.id = p.id_socio
JOIN libro l ON p.id_libro = l.id
WHERE p.fecha_devolucion IS NULL;

-- Libros nunca prestados (LEFT JOIN)
SELECT l.*
FROM libro l
LEFT JOIN prestamo p ON l.id = p.id_libro
WHERE p.id IS NULL;

-- Autores con número de libros prestados (JOIN + GROUP BY)
SELECT l.autor, COUNT(p.id) AS libros_prestados
FROM libro l
JOIN prestamo p ON l.id = p.id_libro
GROUP BY l.autor
ORDER BY libros_prestados DESC;

-- 4. Consultas Resumen (8 consultas - 2.4 puntos)
-- Número de socios por ciudad
SELECT ciudad, COUNT(*) AS numero_socios
FROM socio
GROUP BY ciudad;

-- Promedio de antigüedad de bibliotecarios
SELECT AVG(antiguedad) AS promedio_antiguedad
FROM bibliotecario;

-- Cantidad de préstamos por mes en 2023
SELECT substr(fecha_prestamo, 6, 2) AS mes, COUNT(*) AS numero_prestamos
FROM prestamo
WHERE fecha_prestamo LIKE '2023-%'
GROUP BY mes;

-- Libros más populares (por veces prestados)
SELECT l.titulo, COUNT(p.id) AS veces_prestado
FROM libro l
JOIN prestamo p ON l.id = p.id_libro
GROUP BY l.titulo
ORDER BY veces_prestado DESC;

-- Socios más activos (por préstamos realizados)
SELECT s.nombre, COUNT(p.id) AS numero_prestamos
FROM socio s
JOIN prestamo p ON s.id = p.id_socio
GROUP BY s.nombre
ORDER BY numero_prestamos DESC;

-- Porcentaje de libros disponibles
SELECT 
    (COUNT(*) * 100 / (SELECT COUNT(*) FROM libro)) AS porcentaje
FROM libro
WHERE disponible = 1;

-- Días promedio de préstamo
SELECT AVG(julianday(fecha_devolucion) - julianday(fecha_prestamo)) AS dias_promedio
FROM prestamo
WHERE fecha_devolucion IS NOT NULL;

-- Número de préstamos por categoría de socio
SELECT s.categoria, COUNT(p.id) AS numero_prestamos
FROM socio s
JOIN prestamo p ON s.id = p.id_socio
GROUP BY s.categoria;

-- 5. Subconsultas (8 consultas - 1.2 puntos)
-- Socios que han prestado libros de Gabriel García Márquez
SELECT *
FROM socio
WHERE id IN (
    SELECT id_socio
    FROM prestamo
    WHERE id_libro IN (
        SELECT id
        FROM libro
        WHERE autor = 'Gabriel García Márquez'
    )
);

-- Libros con préstamos superiores al promedio
SELECT l.titulo
FROM libro l
WHERE (
    SELECT COUNT(*)
    FROM prestamo p
    WHERE p.id_libro = l.id
) > (
    SELECT AVG(contador)
    FROM (
        SELECT COUNT(*) AS contador
        FROM prestamo
        GROUP BY id_libro
    )
);

-- Socios con todos los préstamos devueltos a tiempo
SELECT *
FROM socio
WHERE id NOT IN (
    SELECT id_socio
    FROM prestamo
    WHERE fecha_devolucion > date(fecha_prestamo, '+14 days')
);

-- Bibliotecarios que no han gestionado préstamos
SELECT *
FROM bibliotecario
WHERE id NOT IN (
    SELECT id_bibliotecario
    FROM prestamo
);

-- Socios que han prestado más libros que el promedio
SELECT s.nombre, COUNT(p.id) AS numero_prestamos
FROM socio s
JOIN prestamo p ON s.id = p.id_socio
GROUP BY s.id
HAVING COUNT(p.id) > (
    SELECT AVG(contador)
    FROM (
        SELECT COUNT(*) AS contador
        FROM prestamo
        GROUP BY id_socio
    )
);

-- Libros disponibles que nunca han sido prestados
SELECT *
FROM libro
WHERE disponible = 1
AND id NOT IN (
    SELECT id_libro
    FROM prestamo
);

-- Socios con préstamos en todas las categorías de libros
SELECT s.nombre
FROM socio s
WHERE (
    SELECT COUNT(DISTINCT l.genero)
    FROM prestamo p
    JOIN libro l ON p.id_libro = l.id
    WHERE p.id_socio = s.id
) = (
    SELECT COUNT(DISTINCT genero)
    FROM libro
);

-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid
SELECT b.nombre
FROM bibliotecario b
WHERE (
    SELECT COUNT(DISTINCT p.id_socio)
    FROM prestamo p
    JOIN socio s ON p.id_socio = s.id
    WHERE p.id_bibliotecario = b.id
    AND s.ciudad = 'Madrid'
) = (
    SELECT COUNT(*)
    FROM socio
    WHERE ciudad = 'Madrid'
);
