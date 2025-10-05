# Base ligera
FROM openjdk:17-slim

# Directorio de trabajo
WORKDIR /app

# Descargar Metabase
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# Reducir uso de memoria y threads
# -Xmx: máximo de memoria
# -Xms: memoria inicial
# UseSerialGC: recolector de basura más simple
# maxThreads: menos threads para no saturar la instancia
ENV JAVA_OPTS="-Xmx256m -Xms128m -XX:+UseSerialGC -Dmb.jetty.maxThreads=25 -Dlog4j2.formatMsgNoLookups=true"

# Desactivar drivers que no vas a usar para ahorrar memoria
ENV MB_PLUGINS_DIR=/app/plugins-disabled

# Puerto de Metabase
EXPOSE 3000

# Comando de arranque
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/metabase.jar"]
