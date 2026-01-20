```md
# Práctica: Acceso a bases de datos PostgreSQL con PDO

Práctica de **Desarrollo Web en Entorno Servidor** cuyo objetivo es establecer una conexión desde PHP a una base de datos PostgreSQL utilizando la extensión **PDO**, realizar una consulta SQL de selección y procesar los datos obtenidos.

---

## 🎯 Objetivo de la práctica

- Conectarse a una base de datos PostgreSQL desde PHP.
- Ejecutar una consulta SQL de tipo `SELECT`.
- Procesar y mostrar los datos devueltos por la consulta.
- Utilizar la extensión **PDO para PostgreSQL (pdo_pgsql)**.

---

## 🛠️ Tecnologías utilizadas

- PHP 8
- PostgreSQL
- PDO (`php8.3-pdo-pgsql`)
- Linux (entorno de desarrollo)

---

## 📂 Estructura del proyecto

```

acceso-bbdd-pdo/
├── index.php
├── README.md
└── database/
└── script.sql

````

- `index.php`: script PHP que realiza la conexión y la consulta.
- `database/script.sql`: script de creación de la base de datos, tablas y datos.
- `README.md`: documentación de la práctica.

---

## 🗄️ Base de datos

La base de datos utilizada se llama **`tienda`** y contiene las siguientes tablas:

- `fabricante`
- `producto`

### Creación de la base de datos

Desde la consola de PostgreSQL:

```sql
CREATE DATABASE tienda OWNER postgres;
````

### Ejecución del script SQL

```sql
\c tienda
\i database/script.sql
```

Para comprobar que los datos se han cargado correctamente:

```sql
SELECT * FROM producto;
```

---

## ⚙️ Configuración del entorno

### Instalación de PostgreSQL

```bash
sudo apt install postgresql
```

### Instalación del controlador PDO para PostgreSQL

```bash
sudo apt install php8.3-pdo-pgsql
```

### Configuración de PHP

En el archivo `php.ini` se debe comprobar que la extensión está habilitada:

```
extension=pdo_pgsql
```

Tras la modificación, reiniciar el servidor web:

```bash
sudo systemctl restart apache2
# o
sudo systemctl restart nginx
```

---

## 🔌 Conexión a la base de datos desde PHP

El script PHP realiza:

* La conexión a PostgreSQL mediante PDO.
* La ejecución de una consulta de selección sobre la tabla `producto`.
* La visualización de los resultados obtenidos.

La conexión se realiza utilizando los parámetros de conexión adecuados (servidor, base de datos, usuario y contraseña).

---


