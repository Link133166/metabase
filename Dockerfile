# Base ligera
FROM openjdk:17-slim

# Directorio de trabajo
WORKDIR /app

# Descargar Metabase
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# Crear carpeta para H2 persistente
RUN mkdir -p /app/metabase.db

# Reducir uso de memoria y threads, pero suficiente para Render
ENV JAVA_OPTS="-Xmx512m -Xms256m -XX:+UseSerialGC -Dmb.jetty.maxThreads=10 -Dlog4j2.formatMsgNoLookups=true"

# Configuración H2 persistente
ENV MB_DB_FILE=/app/metabase.db/metabase.db

# Desactivar plugins que no vas a usar para ahorrar memoria
ENV MB_PLUGINS_DIR=/app/plugins-disabled

# Exponer puerto (Render lo detecta automáticamente)
EXPOSE 3000

# Comando de arranque usando puerto dinámico de Render
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/metabase.jar --port $PORT"]
