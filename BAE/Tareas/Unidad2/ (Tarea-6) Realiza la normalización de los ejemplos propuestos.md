# <img decoding="async" src="https://github.com/user-attachments/assets/f0b8716c-d8fc-49d6-a898-0efdae03caf8" width="50px"/>  Code, Learn & Practice(Base de datos (Ejercicios de Normalización de Bases de Datos (1FN y 2FN)")

    IMP: Genera las claves necesarias para corregir las tablas resultantes.

## Ejercicio 1: Lista de Productos
### Tabla Inicial: Productos
|ID_Producto | Nombre_Producto |	Proveedores |	Categoría | Precio|
|------------|-----------------|----------------|-------------|-------|
 1 	     |      Laptop  |	Dell, HP |	       Tecnología 	|  1000|
 2    |   Mouse 	| Logitech 	|Accesorios |	25|

### Tareas:

    Aplicar 1FN, eliminando los valores multivaluados en "Proveedores".
    Aplicar 2FN, asegurando que cada campo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">

### 1FN (Primera Forma Normal):
| ID_Producto | Nombre_Producto | Proveedor | Categoría   | Precio |
|-------------|-----------------|-----------|-------------|--------|
| 1           | Laptop          | Dell      | Tecnología  | 1000   |
| 1           | Laptop          | HP        | Tecnología  | 1000   |
| 2           | Mouse           | Logitech  | Accesorios  | 25     |

### 2FN (Segunda Forma Normal):

#### Tabla Productos:
| ID_Producto | Nombre_Producto | Categoría   | Precio |
|-------------|-----------------|-------------|--------|
| 1           | Laptop          | Tecnología  | 1000   |
| 2           | Mouse           | Accesorios  | 25     |

#### Tabla Proveedores:
| ID_Producto | Proveedor |
|-------------|-----------|
| 1           | Dell      |
| 1           | HP        |
| 2           | Logitech  |

 </div>
 </details>
 
## Ejercicio 2: Pedidos de Clientes
### Tabla Inicial: Pedidos
|ID_Pedido | Cliente | Dirección | Producto | Cantidad | Precio|
|----------|---------|-----------|----------|----------|-------|
101 |Juan Pérez 	|Calle 123 |	Laptop 	|1 |	1000
102 |	Ana López |	Av. Central | 	Teclado |	2 	|50

### Tareas:

    Aplicar 1FN, separando valores repetidos y creando nuevas tablas si es necesario.
    Aplicar 2FN, asegurando que las dependencias parciales sean eliminadas.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">

### 1. Primera Forma Normal (1FN)

**Clientes**
| ID_Cliente | Nombre     | Dirección     |
|------------|------------|---------------|
| 1          | Juan Pérez | Calle 123     |
| 2          | Ana López  | Av. Central   |

**Pedidos**
| ID_Pedido | ID_Cliente | ID_Producto | Cantidad |
|-----------|------------|-------------|----------|
| 101       | 1          | 1           | 1        |
| 102       | 2          | 2           | 2        |

**Productos**
| ID_Producto | Nombre  | Precio |
|-------------|---------|--------|
| 1           | Laptop  | 1000   |
| 2           | Teclado | 50     |

### 2. Segunda Forma Normal (2FN)
| ID_Pedido | ID_Cliente | Fecha_Pedido |
|-----------|------------|--------------|
| 101       | 1          | 2024-02-19  |
| 102       | 2          | 2024-02-19  |

**Tabla: Detalle_Pedido**

| ID_Pedido | ID_Producto | Cantidad |
|-----------|-------------|----------|
| 101       | 1           | 1        |
| 102       | 2           | 2        |

**Tabla: Clientes**

| ID_Cliente | Nombre     | Dirección   |
|------------|------------|-------------|
| 1          | Juan Pérez | Calle 123   |
| 2          | Ana López  | Av. Central |

**Tabla: Productos**

| ID_Producto | Nombre_Producto | Precio |
|-------------|-----------------|--------|
| 1           | Laptop          | 1000   |
| 2           | Teclado         | 50     |

---


 </div>
 </details>
 
## Ejercicio 3: Registro de Empleados
### Tabla Inicial: Empleados
|ID_Empleado | Nombre | Teléfonos |	Departamento|
|------------|--------|-----------|-------------|
1 	|Carlos R. 	|12345, 67890| 	Ventas|
2 |	Laura M. |	54321 |	Finanzas|

### Tareas:

    Aplicar 1FN, eliminando los valores multivaluados en "Teléfonos".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">
       
### 1. Primera Forma Normal (1FN)

**Tabla: Empleados**

| ID_Empleado | Nombre   | Departamento |
|-------------|----------|--------------|
| 1           | Carlos R.| Ventas       |
| 2           | Laura M. | Finanzas     |

**Tabla: Telefonos_Empleados**

| ID_Empleado | Teléfono |
|-------------|----------|
| 1           | 12345    |
| 1           | 67890    |
| 2           | 54321    |

---

## Segunda Forma Normal (2FN)
```Se quedaria igual ya que en el primero pide separar los teléfonos y ya no se puede dividir en más```

 </div>
 </details>
 
### Ejercicio 4: Reservas de Hotel
## Tabla Inicial: Reservas
|ID_Reserva | Cliente | Habitación |Fechas | Precio|
|-----------|---------|------------|-------|-------|
5001 	|Pedro G. 	|101| 	01/02, 02/02, 03/02| 	300
5002 	|María T. 	|202 |	10/03, 11/03 |	200

### Tareas:

    Aplicar 1FN, eliminando los valores multivaluados en "Fechas".
    Aplicar 2FN, asegurando que las dependencias parciales sean eliminadas.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">


### 1FN (Primera Forma Normal):
| id_reserva | cliente  | habitacion | fecha      | precio |
|------------|----------|------------|------------|--------|
| 5001       | Pedro G. | 101        | 2025-02-01 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-02 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-03 | 300    |
| 5002       | María T. | 202        | 2025-03-10 | 200    |
| 5002       | María T. | 202        | 2025-03-11 | 200    |

### 2FN (Segunda Forma Normal):

#### Tabla Reservas:
| id_reserva | cliente  | habitacion | precio |
|------------|----------|------------|--------|
| 5001       | Pedro G. | 101        | 300    |
| 5002       | María T. | 202        | 200    |

#### Tabla Fechas_Reserva:
| id_reserva | fecha      |
|------------|------------|
| 5001       | 2025-02-01 |
| 5001       | 2025-02-02 |
| 5001       | 2025-02-03 |
| 5002       | 2025-03-10 |
| 5002       | 2025-03-11 |
       
 </div>
 </details>
 
### Ejercicio 5: Inscripciones a Cursos
## Tabla Inicial: Inscripciones
|ID_Inscripción | Estudiante | Curso | Profesor | Horarios|
|---------------|------------|-------|----------|---------|
3001 |	Luis R.| 	Matemáticas| 	Prof. Pérez| 	Lunes 10AM, Miércoles 2PM|
3002 |	Ana S.| 	Física 	|Prof. Gómez| 	Martes 3PM|

#### Tareas:

    Aplicar 1FN, eliminando valores multivaluados en "Horarios".
    Aplicar 2FN, asegurando que cada campo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">
       
 ### 1FN (Primera Forma Normal):
| id_inscripcion | estudiante | curso       | profesor    | horario        |
|----------------|------------|-------------|-------------|----------------|
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM     |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Miércoles 2PM  |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM     |

### 2FN (Segunda Forma Normal):

#### Tabla Inscripciones:
| id_inscripcion | estudiante | id_curso |
|----------------|------------|----------|
| 3001           | Luis R.    | 1        |
| 3001           | Luis R.    | 1        |
| 3002           | Ana S.     | 2        |

#### Tabla Cursos:
| id_curso | curso       | profesor    | horario        |
|----------|-------------|-------------|----------------|
| 1        | Matemáticas | Prof. Pérez | Lunes 10AM     |
| 1        | Matemáticas | Prof. Pérez | Miércoles 2PM  |
| 2        | Física      | Prof. Gómez | Martes 3PM     |
 </div>
 </details>
 
## Ejercicio 6: Ventas de Tienda
### Tabla Inicial: Ventas
|ID_Venta | Cliente | Productos Comprados | Total|
|---------|---------|---------------------|------|
8001 	|Juan P.| 	Celular, Funda| 	500|
8002 	|Andrea M.|Laptop |1000|

### Tareas:

    Aplicar 1FN, separando valores multivaluados en "Productos Comprados".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">


### 1FN (Primera Forma Normal):
| id_venta | cliente   | producto_comprado | costo_total |
|----------|-----------|--------------------|-------------|
| 8001     | Juan P.   | Celular            | 500         |
| 8001     | Juan P.   | Funda              | 500         |
| 8002     | Andrea M. | Laptop             | 1000        |

### 2FN (Segunda Forma Normal):

#### Tabla Ventas:
| id_venta | cliente   | costo_total |
|----------|-----------|-------------|
| 8001     | Juan P.   | 500         |
| 8002     | Andrea M. | 1000        |

#### Tabla Productos:
| id_venta | producto_comprado |
|----------|--------------------|
| 8001     | Celular            |
| 8001     | Funda              |
| 8002     | Laptop             |
       
 </div>
 </details>
 
## Ejercicio 7: Biblioteca de Libros
### Tabla Inicial: Libros
|ID_Libro | Título 	|Autores | Género|
|---------|---------|--------|-------|
101 	|El Quijote| 	Cervantes| 	Novela
102 	|1984 |	Orwell 	|Ciencia Ficción

#### Tareas:

    Aplicar 1FN, eliminando valores multivaluados en "Autores".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">

### 1FN (Primera Forma Normal):
| ID_Libro | Título    | Autor     | Género           |
|----------|-----------|-----------|------------------|
| 101      | El Quijote| Cervantes | Novela           |
| 102      | 1984      | Orwell    | Ciencia Ficción  |

### 2FN (Segunda Forma Normal):

#### Tabla Libros:
| ID_Libro | Título    | Género           |
|----------|-----------|------------------|
| 101      | El Quijote| Novela           |
| 102      | 1984      | Ciencia Ficción  |

#### Tabla Autores:
| ID_Libro | Autor     |
|----------|-----------|
| 101      | Cervantes |
| 102      | Orwell    |
       
 </div>
 </details>
 
## Ejercicio 8: Facturación de Servicios
### Tabla Inicial: Facturas
|ID_Factura | Cliente |	Servicios Contratados | Costo Total |
|-----------|---------|-----------------------|-------------|
9001 |	Juan P. |	Internet, TV |	50|
9002 |	Ana M. |	Teléfono |	20|
### Tareas:

    Aplicar 1FN, separando valores multivaluados en "Servicios Contratados".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">

### 1FN (Primera Forma Normal):
| ID_Factura | Cliente | Servicio Contratado | Costo Total |
|------------|---------|---------------------|-------------|
| 9001       | Juan P. | Internet            | 50          |
| 9001       | Juan P. | TV                  | 50          |
| 9002       | Ana M.  | Teléfono            | 20          |

### 2FN (Segunda Forma Normal):

#### Tabla Facturas:
| ID_Factura | Cliente | Costo Total |
|------------|---------|-------------|
| 9001       | Juan P. | 50          |
| 9002       | Ana M.  | 20          |

#### Tabla Servicios:
| ID_Factura | Servicio Contratado |
|------------|---------------------|
| 9001       | Internet            |
| 9001       | TV                  |
| 9002       | Teléfono            |  
 </div>
 </details>
 
## Ejercicio 9: Gestión de Vehículos
### Tabla Inicial: Vehículos
|ID_Vehículo| Marca   |Modelos | Año|
|-----------|---------|--------|----|
5001 | Toyota| 	Corolla, Yaris|	2022
5002 | Honda| 	Civic 	|2023
### Tareas:

    Aplicar 1FN, eliminando valores multivaluados en "Modelos".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">
       
### 1FN (Primera Forma Normal):
| id_vehiculo | marca  | modelo  | anio |
|-------------|--------|---------|------|
| 5001        | Toyota | Corolla | 2022 |
| 5001        | Toyota | Yaris   | 2022 |
| 5002        | Honda  | Civic   | 2023 |

### 2FN (Segunda Forma Normal):

#### Tabla Vehículos:
| id_vehiculo | marca  | anio |
|-------------|--------|------|
| 5001        | Toyota | 2022 |
| 5002        | Honda  | 2023 |

#### Tabla Modelos:
| id_vehiculo | modelo  |
|-------------|---------|
| 5001        | Corolla |
| 5001        | Yaris   |
| 5002        | Civic   |
       
 </div>
 </details>
 
## Ejercicio 10: Gestión de Proyectos
### Tabla Inicial: Proyectos
|ID_Proyecto| Nombre |	Miembros |	Presupuesto|
|-----------|--------|-----------|-------------|
7001 |	Web App| 	Juan, Ana| 	5000
7002 |	E-commerce|	Pedro, María| 	10000
### Tareas:

    Aplicar 1FN, eliminando valores multivaluados en "Miembros".
    Aplicar 2FN, asegurando que cada atributo dependa completamente de la clave primaria.

    Verifica generando el modelo Entidad/Relación
 <details>
 <summary>Respuesta ✨</summary>
   <div align="center">
      
### 1FN (Primera Forma Normal):
| id_proyecto | nombre     | miembro | presupuesto |
|-------------|------------|---------|-------------|
| 7001        | Web App    | Juan    | 5000        |
| 7001        | Web App    | Ana     | 5000        |
| 7002        | E-commerce | Pedro   | 10000       |
| 7002        | E-commerce | María   | 10000       |

### 2FN (Segunda Forma Normal):

#### Tabla Proyectos:
| id_proyecto | nombre     | presupuesto |
|-------------|------------|-------------|
| 7001        | Web App    | 5000        |
| 7002        | E-commerce | 10000       |

#### Tabla Miembros:
| id_proyecto | miembro |
|-------------|---------|
| 7001        | Juan    |
| 7001        | Ana     |
| 7002        | Pedro   |
| 7002        | María   | 
 </div>
 </details>
 
