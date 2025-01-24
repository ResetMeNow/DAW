
#  <img decoding="async" src="https://github.com/user-attachments/assets/922b1b9a-da6d-4c54-a66e-fbb6dc1eb322" width="50px"/> Code, Learn & Practice(BAE: Exploración de Sistemas Gestores de Bases de Datos (SGBD))
# Objetivo :information_source:
> Investigar y comparar diferentes tipos de Sistemas Gestores de Bases de Datos (SGBD) para identificar sus características, ventajas y casos de uso.


## Instrucciones
 **1. Tipos de SGBD a investigar: Deberás buscar información sobre al menos cinco (5) SGBD pertenecientes a los siguientes tipos:** 
 
    · Relacionales (ejemplo: MySQL, PostgreSQL).
    · NoSQL (ejemplo: MongoDB, Cassandra).
    · Orientados a grafos (ejemplo: Neo4j, ArangoDB).
    · Almacenamiento en la nube (ejemplo: Amazon RDS, Google BigQuery).
    · Otros (por ejemplo: orientados a objetos, distribuidos, u otros tipos especializados).

   > 📍 Elecciones: `MySQL`, `PostgreSQL`, `Redis`,`MongoDB` y `Neo4j`.


**2. Aspectos a investigar: Para cada SGBD, responde las siguientes preguntas:**
### MySQL 📌
 - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)
     > Respuesta ➡️ Es modelo relacional.
    
 - ¿Cuáles son sus principales características técnicas?
     > Respuesta ➡️ Es un sistema de código abierto con soporte amplio para SQL, cuenta con alta disponibilidad y múltiples motores de almacenamiento.
 - ¿En qué casos de uso se recomienda utilizarlo?
     > Respuesta ➡️ Ideal para aplicaciones web, blogs, y sistemas ERP, gracias a su compatibilidad con muchas tecnologías.
 - ¿Qué ventajas tiene frente a otros SGBD similares?
     > Respuesta ➡️ Sencillez en la configuración, facilidad de aprendizaje y amplia comunidad de soporte.
 - ¿Cuáles son sus limitaciones o desventajas?
     > Respuesta ➡️ No es adecuado para datos no estructurados o consultas muy complejas como las de Big Data.

### PostgreSQL 📌
 - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)
     > Respuesta ➡️ Relacional.
    
 - ¿Cuáles son sus principales características técnicas?
     > Respuesta ➡️ Es altamente extensible, soporta JSON, consultas complejas y transacciones ACID.
 - ¿En qué casos de uso se recomienda utilizarlo?
     > Respuesta ➡️ Útil para proyectos académicos, análisis de datos, aplicaciones empresariales o sistemas de BI.
 - ¿Qué ventajas tiene frente a otros SGBD similares?
     > Respuesta ➡️ Robustez, versatilidad y rendimiento avanzado para transacciones críticas.
 - ¿Cuáles son sus limitaciones o desventajas?
     > Respuesta ➡️ Mayor curva de aprendizaje inicial y configuración más compleja comparada con MySQL.
### Redis 📌
 - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)
     > Respuesta ➡️ Clave-valor.
    
 - ¿Cuáles son sus principales características técnicas?
     > Respuesta ➡️ Almacena datos en memoria, lo que permite altísima velocidad, y admite funcionalidades como Pub/Sub para mensajería en tiempo real.
 - ¿En qué casos de uso se recomienda utilizarlo?
     > Respuesta ➡️ Usado para caching, análisis en tiempo real y colas de tareas.
 - ¿Qué ventajas tiene frente a otros SGBD similares?
     > Respuesta ➡️ Velocidad incomparable en procesamiento de datos.
 - ¿Cuáles son sus limitaciones o desventajas?
     > Respuesta ➡️ No adecuado para almacenamiento a largo plazo ni datos altamente relacionales.

 ### MongoDB 📌
 - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)
     > Respuesta ➡️  Documentos.
    
 - ¿Cuáles son sus principales características técnicas?
     > Respuesta ➡️ Almacena datos en formato JSON, es escalable horizontalmente y ofrece alta flexibilidad en datos no estructurados.
 - ¿En qué casos de uso se recomienda utilizarlo?
     > Respuesta ➡️ Big Data, aplicaciones móviles y sistemas con datos variables.
 - ¿Qué ventajas tiene frente a otros SGBD similares?
     > Respuesta ➡️ Excelente para manejar grandes volúmenes de datos no estructurados.
 - ¿Cuáles son sus limitaciones o desventajas?
     > Respuesta ➡️ Menor rendimiento en consultas complejas o transacciones muy estructuradas.
 ### Neo4j 📌
 - ¿Cuál es su modelo de datos principal (relacional, NoSQL, grafos, etc.)
     > Respuesta ➡️ Grafos.
    
 - ¿Cuáles son sus principales características técnicas?
     > Respuesta ➡️ Diseñado para manejar relaciones complejas entre datos; utiliza Cypher, un lenguaje específico para consultas en grafos.
 - ¿En qué casos de uso se recomienda utilizarlo?
     > Respuesta ➡️ Recomendadores, análisis de redes sociales, genealogía o gráficos de conocimiento.
 - ¿Qué ventajas tiene frente a otros SGBD similares?
     > Respuesta ➡️ Optimizado para datos interconectados y relaciones complejas.
 - ¿Cuáles son sus limitaciones o desventajas?
     > Respuesta ➡️ Menor adopción general y poco adecuado para aplicaciones convencionales.

**3.Formato del informe: Presenta la información en un cuadro comparativo con las siguientes columnas:**  

 :ballot_box_with_check:  Nombre del SGBD  
 :ballot_box_with_check: Tipo de SGBD  
 :ballot_box_with_check: Modelo de datos   
 :ballot_box_with_check: Características principales   
 :ballot_box_with_check: Ventajas   
 :ballot_box_with_check: Limitaciones  
 :ballot_box_with_check: Casos de uso recomendados 

# Entrega:
> [!IMPORTANT]
> El cuadro comparativo debe estar acompañado de una conclusión personal de máximo 200 palabras, explicando cuál de los SGBD investigados te parece más interesante o útil, y por qué.

---  

# Cuadro Comparativo  

|Nombre del SGBD | Tipo | Modelo de datos | Características Principales | Ventajas | Limitaciones | Casos de uso |  
| -------------- | -----| --------------- | --------------------------- | -------- | ------------ | ------------ | 
| MySQL | Relacional | Tablas relacionales |	Open source, SQL, gran comunidad | Fácil de usar, escalable |	Menor soporte NoSQL |	Aplicaciones web, ERP | 
| PostgreSQL | Relacional	| Tablas relacionales	| Open source, extensible, soporte para JSON, alto rendimiento | Robusto, escalabilidad, gran comunidad |	Más complejo de configurar que MySQL |	Aplicaciones empresariales, análisis de datos |
| Redis	| NoSQL	| Clave-valor	| Almacenamiento en memoria, alta velocidad, soporte para Pub/Sub |	Extremadamente rápido	| No es ideal para datos relacionales complejos |	Caching, mensajería en tiempo real | 
| MongoDB |	NoSQL	| Documentos	| JSON, flexible, alta disponibilidad |	Escalabilidad horizontal |	Menor eficiencia en consultas complejas |	Big Data, apps móviles | 
| Neo4j	| Grafos |	Grafos	| Lenguaje Cypher, relaciones complejas optimizadas |	Ideal para datos interconectados |	Limitado a casos específicos de grafos |	Recomendadores, análisis de redes sociales | 

## Conclusión Personal :octocat: 
> [!NOTE]
> De los sistemas gestores de bases de datos investigados, considero que **_PostgreSQL_** es el más útil desde mi perspectiva como estudiante. Su capacidad para manejar tanto datos relacionales como estructuras JSON lo hace una herramienta versátil para proyectos académicos y profesionales, aparte de ideal para aprender sobre bases de datos tradicionales y modernas.  
>
>  Su configuración inicial puede ser más compleja, sus características avanzadas, como la extensibilidad y el soporte para transacciones complejas, lo convierten en una herramienta excelente para aprender sobre bases de datos robustas. Aunque su curva de aprendizaje es más alta, proporciona una base sólida para desarrollar habilidades aplicables a muchos entornos profesionales, lo que lo convierte en una buena opción, sin olvidar que la comunidad y los recursos disponibles facilitan resolver dudas y mejorar habilidades en su uso.
 
