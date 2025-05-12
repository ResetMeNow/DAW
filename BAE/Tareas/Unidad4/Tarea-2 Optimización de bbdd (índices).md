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

- Cree la tabla si clave primaria y incluye a posteriori esta.
  > Nota:Muestra el comando y la salida.

- Define los siguientes indices:
  - Un índice único por el campo "documento" y un índice común por ciudad y provincia. >Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
    -  Vea los índices de la tabla.
      > Nota:Muestra el comando y la salida "show index".

- Agregue un índice único por el campo "telefono".
  > Nota:Muestra el comando y la salida.

- Elimina los índices.
  > Nota:Muestra el comando y la salida.
