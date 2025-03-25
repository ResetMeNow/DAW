# <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/> Code, Learn & Practice(Base de datos (Creación de la Base de Datos")

# Objetivo
## Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos.

# Descripción
### Pasos
**Paso 1: Crear una tabla con un campo de cada tipo** 
**1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada tarea2.db.**

      sqlite3 tarea2.db
 ![image](https://github.com/user-attachments/assets/41afa3ed-7eb3-459d-aa08-64b76bc2042c)

**2. Dentro de SQLite3, crea las siguientes tablas**
- Propietarios: Almacena información de los propietarios.
  - id INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - nombre TEXT no nulo.
  - apellido TEXT no nulo.
  - dni TEXT Valor único.
  - Vehiculos: Almacena información sobre los propietarios de los vehículos.
  - id INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - marca TEXT no nulo.
  - modelo TEXT no nulo.
  - anio INTEGER no nulo.
  - id_propietario INTEGER, FK propietarios(id_propietario).
> Nota: Un propietario puede tener varios vehículos, pero un vehículo pertenece a un único propietario.

Asegúrate de cerrar SQLite3 al finalizar.
![image](https://github.com/user-attachments/assets/b0afd4ab-fd42-4885-9099-3cebd8595283)

Nota: Ayudate de los apuntes.

## Paso 2: Insertar 20 entradas
Dado el siguiente conjunto de información:
 <details>
 <summary>Tabla</summary>
   <div align="center">
     
| id_propietario | nombre    | apellido   | dni        | marca       | modelo     | ano  |
|----------------|-----------|------------|------------|-------------|------------|------|
| 1              | Juan      | Perez      | 12345678A  | Ford        | Fiesta     | 2019 |
| 2              | Maria     | Lopez      | 87654321B  | Toyota      | Corolla    | 2018 |
| 3              | Carlos    | Ruiz       | 11111111C  | Nissan      | Sentra     | 2020 |
| 4              | Laura     | Gomez      | 22222222D  | Chevrolet   | Spark      | 2017 |
| 5              | Pedro     | Martinez   | 33333333E  | Honda       | Civic      | 2016 |
| 6              | Ana       | Fernandez  | 44444444F  | Ford        | Mustang    | 2021 |
| 7              | Diego     | Sanchez    | 55555555G  | Toyota      | RAV4       | 2019 |
| 8              | Sofia     | Torres     | 66666666H  | Volkswagen  | Golf       | 2020 |
| 9              | Javier    | Leon       | 77777777I  | Honda       | CR-V       | 2018 |
| 10             | Lucia     | Castillo   | 88888888J  | Nissan      | Altima     | 2017 |
| 11             | Luis      | Gonzalez   | 99999999K  | Chevrolet   | Malibu     | 2019 |
| 12             | Marta     | Diaz       | 10101010L  | Toyota      | Camry      | 2020 |
| 13             | Victor    | Vargas     | 11111112M  | Honda       | Accord     | 2018 |
| 14             | Elena     | Castro     | 12121212N  | Ford        | Explorer   | 2021 |
| 15             | Roberto   | Blanco     | 13131313O  | Nissan      | Rogue      | 2017 |
| 16             | Natalia   | Paredes    | 14141414P  | Volkswagen  | Jetta      | 2019 |
| 17             | Fernando  | Herrera    | 15151515Q  | Chevrolet   | Equinox    | 2018 |
| 18             | Clara     | Soto       | 16161616R  | Toyota      | Highlander | 2020 |
| 19             | Sergio    | Mendoza    | 17171717S  | Honda       | Odyssey    | 2016 |
| 20             | Patricia  | Navarro    | 18181818T  | Nissan      | Murano     | 2019 |
 </details>
 
***Realiza la inserción en la tablas de modo que la información quede almacenada.***

Guarda algunas de las entradas para el informe.

> Nota: Ayudate de los apuntes.
![image](https://github.com/user-attachments/assets/43f62464-0b4e-456d-a800-d2a3084a77c8)

## Paso 3: Realizar las siguientes 10 consultas de datos
- Seleccionar todos los propietario
- ![image](https://github.com/user-attachments/assets/7b112a8e-1fac-46e2-b8c6-aee4f8bd3908)

- Listar todos los vehículos.
- ![image](https://github.com/user-attachments/assets/9e8c1232-816f-4b36-b7f5-798866e7f19f)

- Seleccionar solo los nombres y apellidos de los propietarios.
- ![image](https://github.com/user-attachments/assets/7f0ef443-4a14-4116-9ae2-42738beee913)

- Listar todas las marcas y modelos de los vehículos.
- ![image](https://github.com/user-attachments/assets/78dbc257-5cb9-4938-9f0d-6e0bbbee497d)

- Seleccionar solo los propietarios con apellido "Perez".
- ![image](https://github.com/user-attachments/assets/de27c388-5da0-45bd-ae60-0c5c324bec71)

- Listar todos los vehículos con año 2019.
- ![image](https://github.com/user-attachments/assets/b9dfd0cd-f1dc-4b5a-88bc-fcc729fd732a)

- Seleccionar propietarios que tienen vehículos de la marca "Toyota".
- ![image](https://github.com/user-attachments/assets/c03e5481-d3e4-4855-a354-52d94f36fad5)

- Listar vehículos con marca "Ford" y modelo "Fiesta".
- Seleccionar propietarios con DNI "12345678A".
- Listar vehículos que pertenecen al propietario con ID 5.
- ![image](https://github.com/user-attachments/assets/fad31631-45e0-4227-99c5-45b5ade97b15)


## Paso 4: Realiza los siguientes updates

- Actualizar el nombre de un propietario con DNI "12345678A".
- Modificar el año de un vehículo con ID 3 a 2022.
- Cambiar el modelo de todos los vehículos Nissan a "Micra".
- Actualizar el apellido de un propietario con ID 7 a "Gomez".
- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
- ![image](https://github.com/user-attachments/assets/3ac6ef31-4931-485a-a3a8-11c90767e83c)

