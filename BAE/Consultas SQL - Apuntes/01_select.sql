 --SELECT Se usa para seleccionar la tabla que queremos visualizar
SELECT * FROM cliente;


/* 
 headers.on/off (Habilita o deshabilita la visualización de las cabeceras en la tabla)
 mode table (Se usa para verlo con cuadriculas/tablas)
 .tables (Se usa para ver las tablas que tenemos en la base de datos)
*/

SELECT nombre FROM cliente; --Consulta de los nombres de la base de datos
SELECT ciudad, nombre FROM cliente; --Y así consultamos los datos que necesitemos
