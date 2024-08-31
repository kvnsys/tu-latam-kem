## Parte 1:Infraestructura e IaC (Preguntas)
1. Identificar la infraestructura necesaria para ingestar, almacenar y exponer datos:
 a. Utilizar el esquema Pub/Sub (no confundir con servicio Pub/Sub de Google)
para ingesta de datos
 b. Base de datos para el almacenamiento enfocado en analítica de datos
 c. Endpoint HTTP para servir parte de los datos almacenados
2. (Opcional) Deployar infraestructura mediante Terraform de la manera que más te acomode. Incluir código fuente Terraform. No requiere pipeline CI/CD.

## Respuestas Parte 1:

> Disclaimer: NO cuento con una cuenta en AWS con créditos disponibles para hacer un despliegue REAL de la infraestructura deseada. Espero sepan entender que adapté el examen utilizando herramientas y soluciones que también puedo emular en local como si AWS se tratase. (Ver "localstack" como emulador local de nube) [localstack-link](https://github.com/localstack/localstack)

1. (A) La ingesta bien puede realizarse mediante el uso recomendado de Pub/Sub para eventos y almacenamiento/procesamiento posterior usando topics, subscribers y producers. Esto permite leer los eventos de forma asincrónica y tener los datos disponibles para ser posteriormente procesados, pudiendo manipular el tiempo y expiración de los eventos en los tópicos. Dependiendo de la complejidad del ETL necesario y la transformación de los datos requeridas, puede que sea preciso utilizar una etapa de AWS Glue para hacer las transformaciones antes de ser alojadas en un tópico de kafka (ETL).

Los 2 sistemas de cola de mensajes con las que trabajé en el pasado fueron:

 - RabbitMQ (obsoleto y no escala muy bien) para mensajes y eventos entre apis desacopladas que corrian cargas de trabajo asicrónicas para un diario Online.
 - Kafka que cuenta con las bondades de escalabilidad y adopción en managed services en nubes como GCP, AWS y Azure.
El servicio managed de kafka stream para AWS que conozco y utilizaría es el de **Amazon Managed Streaming para Apache Kafka (MSK)**

1. (B) Como Base de datos para el almacenamiento enfocado en analítica de datos **elegiría Redshift** que es mas simple ya que es un servicio gestionado por AWS o Bigquery en su variante de GCP. Ambos permiten realizar consultas SQL complejas para analítica avanzada (de acuerdo a lo que solicitan). Sin embargo, también podria resolverse con **Amazon Athena y S3** para un enfoque serverless con datos ya almacenados en S3 o bien mediante el uso de una base de datos relacional **en caso que el volumen de datos no sea tan grande como PostgreSQL o RDS** (managed service para BD relacionales en AWS).

IMPORTANTE: Debido a la falta de créditos provistos para hacer el ejercicio con Redshift, lo resolveré con una BD postgresql relacional que es mas económica, sepan disculparme, se que no es lo mas apropiado para grandes volúmenes de datos pero es lo que tengo para resolver el examen.

1. (C) En cuanto a endpoint HTTP pensado para servir datos almacenados, utilizaria uno que sea brindado por un servicio cloud managed, como por ejemplo AWS API Gateway. Aunque se puede hacer algo parecido con el uso de reverse-proxy utilizando NGINX, Apache o similares en casos donde estemos apremiados por tema costos.

2. Podrán encontrar una "aproximación" de un despliegue con la mayoria de los recursos necesarios para resolver la actividad dentro de la carpeta `tflocal`.

```
├── main.tf
├── outputs.tf
├── plan.txt                # Output del PLAN realizado sobre localstack
├── provider.tf             # Contiene información básica y redirección para utilizar los servicios de localstack
├── variables.tf            # Variables del proyecto. Completando estas, estariamos estableciendola para los niveles inferiores y sus módulos
├── lambda                  # Contiene una plantilla base que serviria para desplegar una Lambda y su API-GATEWAY
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── rds                     # Sería el reemplazo de Redshift por una base relacional en Managed Postgresql (RDS para AWS)
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── security-group          # Security Group para controlar accesos y redes en RDS
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── subnet                  # Subnets desplegadas para la VPC
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
└── vpc                     # VPC para nuestro proyecto
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```

Espero este ejercicio sea suficiente para demostrar capacidades a la hora de desplegar la IaC necesaria de acuerdo a la necesidad indicada aunque no sea la de un ambiente real.