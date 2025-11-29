# 📝 **ENUNCIADO — SIMULACIÓN REAL (ESTILO PROFESOR)**

*(Basado directamente en 1.1.3 del PDF y el punto 2, pero con nombres diferentes para practicar)*

---

## **Actividad de configuración de un entorno de publicación web con Nginx y PHP-FPM**

En este ejercicio deberá realizar la configuración completa de un servidor web utilizando Nginx, de forma que se publiquen **dos sitios web distintos**, ambos accesibles desde el mismo servidor pero bajo reglas de resolución diferentes. Además, el servidor deberá estar preparado para procesar páginas PHP mediante PHP-FPM.

El sistema se encuentra con Nginx previamente instalado, y deberá configurar los elementos necesarios para cumplir los requisitos que se detallan a continuación.

---

## **1. Sitio web por defecto del servidor**

Configure un servidor virtual que actuará como **servidor por defecto** al escuchar en el puerto 80.

Este servidor deberá servir contenido almacenado en la ruta:

```
/var/www/portal
```

En dicho directorio existirán los archivos:

* `portal.html`
* `subportal.html`

El servidor deberá:

* utilizar `subportal.html` como índice principal,
* cuando se acceda a `/`, servir explícitamente el archivo `portal.html`,
* gestionar las peticiones a imágenes con extensión `.jpg` o `.jpeg`, de forma que se intenten localizar en el directorio

  ```
  /var/www/aplicacion/imagenes
  ```

  mediante la directiva `try_files`,
  devolviendo un error 404 si el recurso no existe.

---

## **2. Sitio web principal asociado al dominio**

Configure un segundo servidor virtual que responderá exclusivamente a:

```
www.sistemaapp.com
```

El contenido de este sitio se encontrará en:

```
/var/www/aplicacion
```

Este sitio contendrá los siguientes archivos y directorios:

* `inicio.dpl`
* `inicio.html`
* `secreto/secreto.html`
* `secreto/interno/secreto.html`
* `internos/p404.html`
* `info.php`

El servidor deberá:

1. Declarar como índices, por este orden:

   * `inicio.dpl`
   * `inicio.html`

2. Incorporar tipos MIME adicionales para:

   * `.dpl` como `text/html`
   * `.img` como `image/png`

3. Manejar las extensiones `.jpg` y `.jpeg` mediante un `location` que intente localizar los recursos en:

   ```
   /var/www/aplicacion/imagenes
   ```

4. Configurar un bloque de localización para el directorio `/secreto`, cuyo índice será `secreto.html`, y que deberá evaluar secuencialmente mediante `try_files` las siguientes rutas:

   * `/secreto/interno/`
   * `/secreto/`
   * si no existe → devolver el error 404

5. Configurar una página de error 404 personalizada ubicada en:

   ```
   /internos/p404.html
   ```

   El directorio `/internos` deberá declararse como **internal**, de modo que no pueda accederse directamente.

6. Preparar la ejecución de la página `info.php` mediante el uso de PHP-FPM y FastCGI.

---

## **3. Configuración de PHP-FPM**

Instale y configure PHP-FPM para que utilice un socket Unix en:

```
/run/php/php-fpm.sock
```

Asegúrese de que la configuración del *pool* correspondiente está correctamente ajustada y de que el servicio es capaz de aceptar peticiones desde Nginx.

---

## **4. Validación**

Compruebe el funcionamiento correcto de:

* el acceso al sitio por defecto mediante la IP del servidor,
* el acceso al sitio asociado al dominio `www.sistemaapp.com`,
* la correcta resolución de peticiones hacia el directorio `/secreto`,
* el manejo del error 404 personalizado,
* la ejecución de `info.php`.

---

## **5. Entrega de la actividad**

Utilice el cliente SFTP proporcionado en el aula para transferir al servidor indicado por el profesor los directorios de los sitios web configurados, así como el archivo del bloque del servidor creado en:

```
/etc/nginx/sites-available
```

---

# 🎯 **FIN DEL ENUNCIADO**


