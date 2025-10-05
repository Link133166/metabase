# Base ligera
FROM openjdk:17-slim

# Directorio de trabajo
WORKDIR /app

# Descargar Metabase
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# Reducir uso de memoria y threads
ENV JAVA_OPTS="-Xmx192m -Xms128m -XX:+UseSerialGC -Dmb.jetty.maxThreads=20 -Dlog4j2.formatMsgNoLookups=true"

# Desactivar drivers que no vas a usar para ahorrar memoria
ENV MB_PLUGINS_DIR=/app/plugins-disabled

# Exponer puerto (Render lo detecta automáticamente)
EXPOSE 3000

# Comando de arranque usando el puerto dinámico de Render
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/metabase.jar --port $PORT"]
