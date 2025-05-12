# Tarea 2 de trabajo con índices
---
Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)
---
Se pide:

- Elimine la tabla "cliente" si existe.
  > Nota:Muestra el comando y la salida.
<details>
<summary>Respuesta</summary>
  
```sql
DROP TABLE IF EXISTS cliente;
```
![image](https://github.com/user-attachments/assets/e6ed74f3-fe73-471a-a986-43091043a8e1)

   </details>


---

- Cree la tabla si clave primaria y incluye a posteriori esta.
  > Nota:Muestra el comando y la salida.
<details>
<summary>Respuesta</summary>  
  
```sql
CREATE TABLE cliente (
  documento CHAR(8)   NOT NULL,
  nombre    VARCHAR(30) NOT NULL,
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),
  telefono  VARCHAR(11)
) ENGINE=InnoDB;
```
![image](https://github.com/user-attachments/assets/ee498bc7-7601-4f76-8e09-3469c45c6b18)
```sql
ALTER TABLE cliente
  ADD PRIMARY KEY (documento);
```
![image](https://github.com/user-attachments/assets/900d4cd9-a47f-43e8-8b46-785dda17cea4)

   </details>
   
---   
- Define los siguientes indices:
  - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    >Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
<details>
<summary>Respuesta</summary>  
  
```sql
CREATE UNIQUE INDEX idx_documento ON cliente(documento);
```
![image](https://github.com/user-attachments/assets/03ffb4f2-e291-41b8-83c1-8c82bd24b755)
```sql
CREATE INDEX idx_ciudad_provincia ON cliente(ciudad, provincia);
```
![image](https://github.com/user-attachments/assets/af6203b1-9d71-47ec-af26-78a76fced067)
```sql
-- Justificación:
-- UNIQUE INDEX evita que dos clientes tengan el mismo documento.
-- INDEX acelera las búsquedas por ciudad y provincia sin impedir duplicados.
```
</details>

---
- Vea los índices de la tabla.
  > Nota:Muestra el comando y la salida "show index".
<details>
<summary>Respuesta</summary>  
  
```sql
SHOW INDEX FROM cliente;
```
![image](https://github.com/user-attachments/assets/40c58e63-fc86-4d01-9056-4687971de908)


</details>


---

- Agregue un índice único por el campo "telefono".
  > Nota:Muestra el comando y la salida.
<details>
<summary>Respuesta</summary>
  
```sql
CREATE UNIQUE INDEX idx_telefono ON cliente(telefono);
```
![image](https://github.com/user-attachments/assets/38fa9f10-0b0c-4e3e-be2b-babbee80885c)


</details> 


--- 

- Elimina los índices.
  > Nota:Muestra el comando y la salida.
<details>
<summary>Respuesta</summary>
  
```sql
DROP INDEX idx_documento ON cliente;
DROP INDEX idx_ciudad_provincia ON cliente;
DROP INDEX idx_telefono ON cliente;
```
![image](https://github.com/user-attachments/assets/b8cc9660-825c-472a-89ab-fbc6c8e921f6)

```sql
--Verificación de la elmiminación
SHOW INDEX FROM cliente;
```
![image](https://github.com/user-attachments/assets/ec5b911d-0341-46f2-b206-c91a33e5e911)

   </details>
