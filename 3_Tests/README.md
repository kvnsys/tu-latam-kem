Parte 3: Pruebas de Integración y Puntos Críticos de Calidad
1. Implementa en el flujo CI/CD en test de integración que verifique que la API efectivamente está exponiendo los datos de la base de datos. Argumenta.
2. Proponer otras pruebas de integración que validen que el sistema está funcionando correctamente y cómo se implementarían.
3. Identificar posibles puntos críticos del sistema (a nivel de fallo o performance) diferentes al punto anterior y proponer formas de testearlos o medirlos (no implementar)
4. Proponer cómo robustecer técnicamente el sistema para compensar o solucionar dichos puntos críticos


## Respuestas

1. El flujo de CI/CD no pude llegar a implementarlo por cuestiones de tiempo. Alcancé a armar el endpoint e hice un despliegue de la infra en mi cluster de casa de Kubernetes montado sobre raspberrys, pero por falta de creditos en la nube me demoró un poco armar todo el escenario.

2. Idem punto anterior.

3. Entre los puntos críticos, está la cola de mensajes MSK con sus brokers y la ingesta de datos, esta a menudo puede traer inconvenientes si no se hace un buen manejo de errores por parseo o formato. La importación es clave para la continuidad del flujo.

4. No llego a completar este punto por tiempo.


