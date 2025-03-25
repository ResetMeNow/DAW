# <img decoding="async" src="https://github.com/user-attachments/assets/499587a4-f43d-4ef8-ae40-f8b04240c07e" width="50px"/> Code, Learn & Practice(Base de datos (Trabajo con funciones en BBDD")

# Objetivo
Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos.

## Descripción
## Pasos
### Paso 1: Creación de la BBDD
**Crea con el siguente contenido el fichero empleados-dump.sql.**

    CREATE TABLE empleados (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     nombre TEXT,
     salario REAL,
     departamento TEXT
    );
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
![image](https://github.com/user-attachments/assets/5f4a438d-7268-4d6c-82d5-db832bbdef46)

    
## Paso 2 Lectura del fichero sql
**Entra en sqlite a través del siguiente comando:**

    sqlite3 tarea3.db 

Haciendo un .read del fichero sql, de nombre empleados-db.sql, realiza la creación e inserción de información de la BBDD.
![image](https://github.com/user-attachments/assets/8f15f941-032a-4386-8dcf-53606aba5fb4)


## Paso 3: Realización de consultas
Realiza las siguientes consultas, y muestra el resultado obtenido:

- Funciones UPPER y LOWER:
  -  Muestra el nombre de todos los empleados en mayúsculas.
- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.
  - ![image](https://github.com/user-attachments/assets/4777a4f2-e5a3-4a72-a420-3f3d58889dc1)

- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
  - Convierte la cadena '123' a un valor entero.
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.
  - ![image](https://github.com/user-attachments/assets/a4fff4dc-f4f2-4354-8ee7-eea21b61e57b)

- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.
  - ![image](https://github.com/user-attachments/assets/ba15b512-9312-4ef8-8b08-67639c6604d2)

- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.
  - ![image](https://github.com/user-attachments/assets/8b4e8fff-61e0-4ad5-8bce-640814c83632)

- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.
  - ![image](https://github.com/user-attachments/assets/c742dd86-f490-4aa2-b933-4ef2354ade79)

- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.
- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.
  - ![image](https://github.com/user-attachments/assets/8bdb0b9e-b1dc-49e4-8008-df0da98a24cf)

- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.
  - ![image](https://github.com/user-attachments/assets/5ef42a80-7066-4cc8-b01c-e707aed95581)

    
- Order By and Like.
  - Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
  - Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
  - Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
  - Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
  - ![image](https://github.com/user-attachments/assets/25f1c1f9-76d6-4649-a6fd-b7f7bb3aa5d0)


  - Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
  - Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
  - Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
  - ![image](https://github.com/user-attachments/assets/262c15aa-4805-4408-8fd6-0196a9c48cd4)

  - Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
  - Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
  - ![image](https://github.com/user-attachments/assets/8f18d0c8-6a02-474a-a2e9-742b5594001f)

   
## Generación Informe
Genera un informe con cada una de las consultas y los resuldos obtenidos tras su ejecución. El informe se debe de realizar en markdown, y enviar el enlace.
