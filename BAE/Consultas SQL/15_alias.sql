--AS
--Usamos AS para crear un alias y reemplar el nombre por otro.
SELECT nombre, puntos_fidelidad AS 'puntos'
FROM cliente
WHERE puntos_fidelidad BETWEEN 1000 AND 1500;



SELECT nombre, apellido1 AS "apellidos" 
FROM cliente
WHERE nombre = 'Patricia';


--CONCAT
--Se usa para concatenar.
SELECT CONCAT ('Nombre: ', nombre, ' - Apellido: ', apellido1) AS 'Nombre Completo'
FROM cliente;
+-------------------------------------+
|           Nombre Completo           |
+-------------------------------------+
| Nombre: Carlos - Apellido: Martínez |
| Nombre: Ana - Apellido: López       |
| Nombre: Miguel - Apellido: Sánchez  |
| Nombre: Elena - Apellido: Gómez     |
| Nombre: David - Apellido: Pérez     |
| Nombre: Laura - Apellido: Jiménez   |
| Nombre: Sofía - Apellido: Hernández |
| Nombre: Javier - Apellido: Domingo  |
| Nombre: Patricia - Apellido: Romero |
| Nombre: Antonio - Apellido: Navarro |
+-------------------------------------+