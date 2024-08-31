## Parte 2: Aplicaciones y flujo CI/CD

1. API HTTP: Levantar un endpoint HTTP con lógica que lea datos de base de datos y los exponga al recibir una petición GET.
2. Deployar API HTTP en la nube mediante CI/CD a tu elección. Flujo CI/CD y ejecuciones deben estar visibles en el repositorio git.
3. (Opcional) Ingesta: Agregar suscripción al sistema Pub/Sub con lógica para ingresar los datos recibidos a la base de datos. El objetivo es que los mensajes recibidos en un tópico se guarden en la base de datos. No requiere CI/CD.
4. Incluye un diagrama de arquitectura con la infraestructura del punto 1.1 y su interacción con los servicios/aplicaciones que demuestra el proceso end-to-end de ingesta hasta el consumo por la API HTTP.

## Parte 2: Respuestas

1. En este directorio podrán encontrar el codigo fuente para la API HTTP lista para desplegar mediante Dockerfile. Esta fue desarrollada en poco tiempo utilizando Python como sugerencia del Challange. Está pensada para que pueda funcionar basada en el trigger de una consulta específica al API Gateway, aunque `Por falta de acceso a una cuenta con créditos de AWS u otra nube` estaré realizando esta etapa de la CI/CD con un cluster de Kubernetes que he desplegado en mi casa.

2. Para este uso pienso que es una buena practica utilizar herramientas disponibles de acuerdo a la eleccion del SCP utilizado. En este caso, utilizando Github, suena lógico hacer uso de las Github Actions para generar algunos pasos que puedan corroborar Lindt, vulnerabilidades y hacer el build de la imagen para corroborar que esta se genera con éxito. Si estas 3 o 4 etapas simples se cumplen, podemos tener una mínima comprobación de correcto build. Para hacer una prueba funcional en contra de la base de datos, recomendaria escribir una pequeña comprobación con alguna operación que genere un número aleatorio en Redshift y así asegurarnos que el endpoint puede leer correctamente la BD. (no llego a desarrollar esto por falta de tiempo y de acceso a una cuenta de AWS con créditos suficientes)


3. La ingesta no la voy a poder realizar en un ambiente real, los costos son muy elevados y como comenté en otras ocaciones, no cuento con créditos AWS para esta tarea. Tampoco se incluyó información de cómo debia estar estructurada la información para la ingesta.

4. El diagrama fue generado haciendo uso de "diagram" mediante python (ver codigo del diagrama y .png incluido en este directorio)

- Incorporé una etapa de Glue posterior a Kafka que me parecía lógica para traducir, parsear, modificar lo que fuera necesario dependiendo del dataSource de origen, aunque podría resolverse utilizando lambda, airflow u otros ETL dependiendo de la necesidad, costo y escalabilidades necesarias.

- Producción: Los datos se publican en un topic de Kafka (Amazon MSK).
- Consumo: AWS Glue consume los datos de Kafka.
- Transformación: AWS Glue transforma los datos.
- Carga: Los datos transformados se cargan en Amazon Redshift.
- Disponibilidad: Los datos en Redshift se consultan y analizan a través de una Lambda
- Exposición: A través de APIGateway
