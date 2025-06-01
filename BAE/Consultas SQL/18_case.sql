--CASE
/*Casos de uso: La cláusula CASE en SQL sirve para implementar
lógica condicional dentro de consultas, permitiendo evaluar 
múltiples condiciones y devolver diferentes valores o realizar
distintas acciones según los resultados. 
Funciona de forma similar a una sentencia if-else*/
 SELECT *,
   ...> CASE
   ...> when comision > 0.8 then 'Es mayor'
   ...> else 'Es menor'
   ...> end AS comisiontext
   ...> from cliente;

   