# Práctica de acceso a bases de datos PostgreSQL con PDO

## Objetivo

El objetivo de esta práctica es conectarse a una base de datos PostgreSQL desde PHP utilizando la extensión **PDO**, ejecutar una sentencia SQL de selección y procesar los datos devueltos por dicha consulta.

---

## Tareas a realizar

### Tarea 1: Descarga e instalación de PostgreSQL

Para la realización de la práctica se debe instalar el gestor de bases de datos PostgreSQL en el sistema Linux.

Una vez instalado PostgreSQL, se accede a la consola de administración ejecutando:

```bash
sudo -u postgres psql
````

A continuación, se cambia la contraseña del usuario `postgres`:

```sql
ALTER USER postgres PASSWORD '123456';
```

---

### Tarea 2: Creación de la base de datos y tablas

Se crea la base de datos `tienda` asignando como propietario al usuario `postgres`:

```sql
CREATE DATABASE tienda OWNER postgres;
```

Una vez creada, se accede a la base de datos:

```sql
\c tienda
```

A continuación, se ejecuta el script SQL que crea las tablas `fabricante` y `producto` e inserta los datos iniciales:

```sql
\i ruta_absoluta/script.sql
```

Para comprobar que los datos se han insertado correctamente, se puede ejecutar la siguiente consulta:

```sql
SELECT * FROM producto;
```

Para salir de la consola de PostgreSQL:

```sql
exit;
```

---

### Tarea 3: Instalación del controlador PDO para PostgreSQL

Se instala el paquete necesario para poder acceder a PostgreSQL desde PHP mediante PDO:

```bash
sudo apt-get install php8.3-pdo-pgsql
```

Después, se debe comprobar que la extensión está habilitada en el archivo `php.ini`, ubicado en:

```
/etc/php/8.3/fpm/php.ini
```

Se verifica que la siguiente línea esté activa:

```
extension=pdo_pgsql
```

Tras realizar los cambios, se reinicia el servidor web para que la configuración tenga efecto:

```bash
sudo systemctl restart nginx
```

(o Apache, en caso de utilizarlo).

---

### Tarea 4: Implementación del script PHP

Se crea un script PHP que realice las siguientes acciones:

* Conexión a la base de datos PostgreSQL mediante PDO.
* Ejecución de una consulta SQL de selección sobre la tabla `producto`.
* Procesamiento y visualización de los datos devueltos por la consulta.

El script debe manejar correctamente los posibles errores de conexión o ejecución de la consulta.

---

## Resultado esperado

* Conexión correcta a la base de datos `tienda`.
* Ejecución de una consulta `SELECT`.
* Visualización de los datos obtenidos de la tabla `producto`.

---

## Observaciones

Esta práctica sirve como base para prácticas posteriores en las que se desarrollará una API REST en PHP reutilizando la conexión a la base de datos y las consultas SQL realizadas.

```



