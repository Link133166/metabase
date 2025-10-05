FROM openjdk:17-slim

WORKDIR /app

# 🔽 Descargar el .jar estable de Metabase
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# 🧰 Variables para control de memoria y rendimiento
ENV JAVA_OPTS="-Xmx256m -Xms128m -XX:+UseSerialGC -Dmb.jetty.maxThreads=25 -Dlog4j2.formatMsgNoLookups=true"

# 🪶 Desactivar drivers no usados (reduce memoria)
ENV MB_PLUGINS_DIR=/app/plugins-disabled

# 🌐 Puerto de exposición
EXPOSE 3000

# 🧹 Liberar locks antes de arrancar Metabase
CMD sh -c "\
  echo '🔄 Liberando locks de migración (si existen)...' && \
  java -jar /app/metabase.jar migrate release-locks || true && \
  echo '🚀 Iniciando Metabase...' && \
  java $JAVA_OPTS -jar /app/metabase.jar"
