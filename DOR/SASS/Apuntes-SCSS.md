
# ¿Qué es un mixin CSS? 📍
 Es como una "función" o "método" que nos permite agrupar y reutilizar propiedades CSS para evitar la repetición de código y facilitar la organización de las hojas de estilo.
> No existen mixin en CSS pero si en SASS.


## ¿Y qué es SASS? ♦️
 Es un preprocesador de CSS que añade características de programación a las hojas de estilo, en resumen, SASS escribe un código que luego se traduce a CSS.


### Entonces, ¿Qué es SCSS? 🧩
 Es una sintaxis de SASS, un preprocesador de CSS, en esencia SCSS es una forma más legible y potente de escribir CSS.

### Tipos de mixin:
```
Mixin sin argumentos✔️
Mixin con argumentos✔️
Mixin con la regla @content✔️
```

## Mixin sin argumentos.✔️
```css
@mixin nombreMixin(){
    background-color: black;
}
header{
    @include nombreMixin()/* en "()" estaran las propiedades que le hayamos dado*/
}


@mixin otroMixin{
    background: black;
}
header{
    @include otroMixin;//Sin () /*Otra manera de usarlo*/
}
```

## Mixin con argumentos.✔️
➡️Siempre con los "()"  
➡️Los argumentos son como las variables 


### Mixin con solo 1 argumento✔️
```css
@mixin nombre($argumento1){
    color: $argumento1;
}

p{
    @include nombre(black);
}
```


### Mixin con más de 1 argumento✔️
```css
@mixin nombre($argumento1, $argumento2, $argumento3){
    color: $argumento1;
    font-size: $argumento2;
    font-weight: $argumento3;
}
p{
    @include nombre(black, bold, 2em);
}

@mixin nombre($argumento1: red){
    color: $argumento1;

}
p{
    @include nombre(); /*El color red puesto se pondra por defecto pero..*/
    @include nombre(black); /*Aqui se reescribe por el color negro*/
}
```

## Mixin con la regla @content✔️
➡️Nos permite usar multiples propiedades CSS dentro de un mixin.  
➡️Muy usado para Responsive Design
```css
@mixin movil(){
   @media screen and (max-width: 480px) {
    @content;
   } 
}
p{
    font-size: 4em;
    @include movil(){
        font-size: 2em;
    }
}
```

## Mixin para Grid✔️
```css
@mixin grid($columnas, $espacio){ 
    display: grid;
    grid-template-columns: repeat($columnas, 1fr);
    gap: $espacio;

    @media screen and (max-width:480px){
        grid-template-columns : 1fr;
        gap: 0em;
    }
}

main{
  @include grid(4,1em );
}

section{
    @include grid(3,2em );
}
```

## Mixin para Responsive Design🟠
```css
@mixin mv($medida: 480px){
    @media screen and(max-width: $medida) {
        @content;
        
    }

}

article{
    width: 25%;
    @include mv(768px){width: 50%}
    @include mv(){width: 100%}
}
```
---
# ✅ COSAS QUE SÍ PUEDES ANIDAR 
> [!IMPORTANT] 
>(y por tanto en SCSS también)

|Contenedor HTML	  |  Puedes meter dentro|
|---------------------|---------------------|
|```<div>```	       |     Todo (es una caja general) ✅|
|```<body>```	       |    Todo el contenido de la web ✅|
|```<section>```       | 	``<h1>, <p>, <img>, <article>`` ✅|
|```<nav>```	        |     ``<ul>, <li>, <a>`` ✅|
|``<ul>`` o ``<ol>``|               Solo ``<li>`` ✅|
|```<li>```	            | Puedes meter`` <a>`` o texto ✅|
|``<button>`` 	        |  Texto, íconos,`` <span>`` ✅|
|``<form>``	            | `` <input>, <label>, <button> ``✅|


> [!WARNING]
>❌ COSAS QUE NO SE PUEDEN METER DENTRO DE OTRAS EN HTML  
>¡y por tanto tampoco en SCSS!
```sql
❌ 1. No puedes meter un <p> dentro de un <h1>, <h2>, etc.

❌ 2. No puedes meter un <div> dentro de un <p>

❌ 3. No metas botones (<button>) 
dentro de etiquetas de texto como <p>, <h1>, etc.

❌ 4. No metas listas (<ul> o <ol>) dentro de párrafos <p>

❌ 5. No metas secciones estructurales 
(como <header>, <section>, <article>) dentro de un <p> o <h1>
```
---

## 🧩📚 CUÁNDO PUEDES Y NO PUEDES ANIDAR EN SCSS (según HTML)
✅ PUEDES anidar cuando:

|Situación HTML	                        |           Ejemplo SCSS correcto|
|---------------------------------------|--------------------------------|
|Un elemento está dentro de otro	              |  .container contiene .row, .btn, etc.|
|Usas pseudoclases o pseudoelementos	         |    &:hover, &::after, &:first-child|
|Un selector depende jerárquicamente del otro|	 nav > ul > li > a|
|Es parte del mismo bloque visual	       |     .card dentro de .grid, li dentro de ul|

> [!CAUTION] 
>❌ NO PUEDES anidar cuando:

|Situación HTML	                     |              ❌ No hagas esto|
|------------------------------------|------------------------------|
|Metes un p dentro de un h1               	  |   h1 { p { ... } } ❌|
|Pones botones dentro de etiquetas de texto	   |  p { button { ... } } ❌|
|Rompe el HTML y el diseño                      |Pones div, section, o ul dentro de un p	❌  |    
|Anidas etiquetas que no están realmente dentro	| Anidar footer dentro de h1, por ejemplo ❌|

> [!TIP]
>📌 Siempre piensa en cómo se estructura el HTML real.

--- 
# 📘OPERADORES SASS (SassScript)
✨ ¿Qué son?
Los operadores en SCSS permiten hacer cálculos dentro del estilo sin escribir números manualmente.  
✅ Tipos de operadores que puedes usar:

|Tipo     	       |  Ejemplo en SCSS           |     Resultado en CSS|
|------------------|----------------------------|---------------------|
|Suma +              |width: 100px + 20px;	|       width: 120px;|
|Resta - 	        |margin: 20px - 5px;	 |            margin: 15px;|
|Multiplicación *	|height: 25px * 2;	      |      height: 50px;|
|División /	 |     font-size: 40px / 2;        |  	font-size: 20px;|

> [!IMPORTANT]
>💡 Cosas importantes al usar operadores:
>Siempre incluye unidades (px, %, em, etc.)

---
## ✅ 1. ¿Hay reglas para aplicar operadores en SCSS?
> [!TIP]
>✔️ No hay reglas "obligatorias", pero sí buenas prácticas:

| ✅ ÚSALOS CUANDO...                                            | ❌ EVÍTALOS SI...                                      |
| ----------------------------------------------------------------|------------------------------------------------------- |
| Necesitas calcular tamaños o proporciones 
  (ej: columnas, paddings, etc.)                                  | Solo estás copiando estilos fijos como `font-size: 16px` |
| Usas variables (`$padding`, `$gutter`, `$base`)                 | Son valores únicos que **no cambian ni se repiten**      |
| Quieres mantener consistencia y hacer escalas                   | Es más fácil escribir el número directamente             |
| Tu diseño tiene lógica matemática 
 (ej: grid, módulos, separación entre elementos)                  | El cálculo no aporta claridad y solo complica            |


--- 
## 🧠 ¿Qué hace #{}?
> [!IMPORTANT]
>Le dice a Sass:
>“Haz esta cuenta y pon el resultado como texto plano”.
>Muy útil para @media, content:, rutas, etc.