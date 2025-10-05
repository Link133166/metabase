# Base ligera
FROM openjdk:17-slim

# Directorio de trabajo
WORKDIR /app

# Descargar Metabase
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# Variables de entorno
# - Memoria máxima 128MB, mínima 64MB
# - Serial GC (ligero)
# - Máx 10 threads
# - Evitar lookup de log4j
ENV JAVA_OPTS="-Xmx128m -Xms64m -XX:+UseSerialGC -Dmb.jetty.maxThreads=10 -Dlog4j2.formatMsgNoLookups=true"

# Desactivar drivers que no se usarán
ENV MB_PLUGINS_DIR=/app/plugins-disabled

# Puerto de Render
ENV PORT=3000

# Carpeta para base de datos H2
RUN mkdir -p /app/metabase.db

# Exponer puerto
EXPOSE $PORT

# Comando de arranque
CMD ["sh", "-c", "java $JAVA_OPTS -DMB_DB_FILE=/app/metabase.db/metabase.db -Dmb.server.port=$PORT -jar /app/metabase.jar"]
