# Tarea 1 de trabajo con índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

- número de inscripción,
- comienza desde 1 cada año,
- año de inscripción,
- nombre del alumno,
- documento del alumno,
- domicilio,
- ciudad,
- provincia,
- clave primaria: número de inscripto y año de inscripción. 

Se pide:

- Elimine la tabla "alumno" si existe.
  > Nota:Muestra el comando y la salida.

<details>
<summary>Respuesta</summary>
  
```sql
 DROP TABLE IF EXISTS alumno; 
```
 ![image](https://github.com/user-attachments/assets/39806458-90d7-4dad-bb1f-a475fd8cc1c8)
   </details>


---
- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
  > Nota:Muestra el comando y la salida.
 <details>
<summary>Respuesta</summary>    
   
```sql
CREATE TABLE alumno (
  nro_inscripcion    INT           NOT NULL,
  anio_inscripcion   INT           NOT NULL,
  nombre             VARCHAR(100)  NOT NULL,
  documento          VARCHAR(20)   NOT NULL,
  domicilio          VARCHAR(150),
  ciudad             VARCHAR(100),
  provincia          VARCHAR(100),
  PRIMARY KEY (anio_inscripcion, nro_inscripcion)
) ENGINE=InnoDB;
```

  ![image](https://github.com/user-attachments/assets/a3ffa3ec-0ad3-4e2f-a3b6-540150588492)
   </details>


---
- Define los siguientes indices:
  - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    > Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
<details>
<summary>Respuesta</summary>

```sql
CREATE UNIQUE INDEX idx_documento
  ON alumno (documento);

CREATE INDEX idx_ciudad_provincia
  ON alumno (ciudad, provincia);

-- Justificación:
-- UNIQUE es para que no haya dos alumnos con el mismo documento.
-- El INDEX sirve para buscar rápido por ciudad y provincia.
```

   ![image](https://github.com/user-attachments/assets/9d3bb09f-33b3-4e8b-bf6e-019f24036d17)

</details>


---
  - Vea los índices de la tabla.
    > Nota:Muestra el comando y la salida "show index".
  <details>
    <summary>Respuesta</summary> 
    
  ```sql
 SHOW INDEX FROM alumno;
 ```
  ![image](https://github.com/user-attachments/assets/30291b4b-8edb-4622-92a6-ddcd20c820b4)
   </details>


---
- Intente ingresar un alumno con clave primaria repetida.
  > Nota:Muestra el comando y la salida.
<details>
 <summary>Respuesta</summary>
    
 ```sql
 INSERT INTO alumno
  (anio_inscripcion, nro_inscripcion, nombre, documento)
VALUES
  (2025, 1, 'Ana Pérez', '12345678A');

INSERT INTO alumno
  (anio_inscripcion, nro_inscripcion, nombre, documento)
VALUES
  (2025, 1, 'Luis Gómez', '87654321B');
 ```
    
![image](https://github.com/user-attachments/assets/2beb0f0a-cca4-46ca-8f52-fd7213322fb4)

   </details>


---
- Intente ingresar un alumno con documento repetido.
  > Nota:Muestra el comando y la salida.
<details>
<summary>Respuesta</summary>
    
```sql
INSERT INTO alumno
  (anio_inscripcion, nro_inscripcion, nombre, documento)
VALUES
  (2025, 2, 'María López', '99999999X');

INSERT INTO alumno
  (anio_inscripcion, nro_inscripcion, nombre, documento)
VALUES
  (2025, 3, 'Pedro Ruiz', '99999999X');
 ```  
   ![image](https://github.com/user-attachments/assets/e5ee8f28-aa2d-440b-b616-835d31dad0ab)

   </details>


---
- Ingrese varios alumnos de la misma ciudad y provincia.
  > Nota:Muestra el comando y la salida.
<details>
  <summary>Respuesta</summary>
    
 ```sql
INSERT INTO alumno
  (anio_inscripcion, nro_inscripcion, nombre, documento, ciudad, provincia)
VALUES
  (2025, 4, 'Elena Martín', '11111111M', 'Sevilla', 'Sevilla'),
  (2025, 5, 'Jorge Díaz',  '22222222D', 'Sevilla', 'Sevilla'),
  (2025, 6, 'Laura Rey',   '33333333R', 'Sevilla', 'Sevilla');

 ```
   ![image](https://github.com/user-attachments/assets/58505ab4-fbad-4981-b3b4-73cdeb57d0ce)

  </details>


---
- Elimina los indices creados, y muestra que ya no se encuentran.
  > Nota:Muestra el comando y la salida.
<details>
  <summary>Respuesta</summary>
  
```sql

DROP INDEX idx_documento ON alumno;
DROP INDEX idx_ciudad_provincia ON alumno;

```
  ![image](https://github.com/user-attachments/assets/8000c7f3-05ce-491e-87b7-f257850190e9)

```sql
-- para verificar
SHOW INDEX FROM alumno;

```
   ![image](https://github.com/user-attachments/assets/a946ce56-73fa-40ec-8804-ab8c79d54bf3)


  </details>

