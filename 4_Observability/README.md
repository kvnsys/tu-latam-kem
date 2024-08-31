Parte 4: Métricas y Monitoreo
1. Proponer 3 métricas (además de las básicas CPU/RAM/DISK USAGE) críticas para entender la salud y rendimiento del sistema end-to-end
2. Proponer una herramienta de visualización y describe textualmente qué métricas mostraría, y cómo esta información nos permitiría entender la salud del sistema para tomar decisiones estratégicas
3. Describe a grandes rasgos cómo sería la implementación de esta herramienta en la nube y cómo esta recolectaría las métricas del sistema
4. Describe cómo cambiará la visualización si escalamos la solución a 50 sistemas similares y qué otras métricas o formas de visualización nos permite desbloquear este escalamiento.
5. Comenta qué dificultades o limitaciones podrían surgir a nivel de observabilidad de los sistemas de no abordarse correctamente el problema de escalabilidad


## Respuestas:

1. Cada uno de los componentes deberia tener un nivel mínimo de monitoreo como los mencionados. 3 Metricas adicionales podrían ser, latencia de la ingesta, Tiempos de respuesta del endpoint y tiempos de respuesta de la BD.
2. Se pueden implementar herramientas como NewRelic, Metricas en Cloudwatch o alternativas opensource para conocer el estado a traves de dashboards.
3. Estamos hablando sobre supuestos, pero supongo que hablamos de analisis de logs de ingesta por errores y de analisis de cada componente por separado en las metricas conversadas arriba. Todos los endpoint deberian responder en tiempo y forma. Se pueden contar con la integracion de un APM que nos permitiria conocer detalles internos de respuesta del enpoint en python. También deberiamos escalar horizontalmente los tableros y dependiendo de las necesidades del negocio se podria evaluar de implementar una infraestructura propia de monitoreo en el caso que escale a 50 sistemas similares. Graphana, Prometheus, Opentelemetry escalan horizontalmente.
4. Respondido en el punto anterior.
5. Que los recursos consumidos por el propio sistema de monitoreo estén compartidos con la infraestructura con la que se da servicios (al usar lambda y servicios SAAS para todo lo armado antes, no sería el caso.) En la infraestructura desplegada para mediciones y metricas podriamos perder observabilidad si no se dimensionan adecuadamente. El proceso de monitoreo podría quedar "chico" para la cantidad de sistemas a monitorear.
