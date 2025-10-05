FROM openjdk:17-slim
WORKDIR /app

ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# 🔧 Reducimos uso de memoria y threads
ENV JAVA_OPTS="-Xmx256m -Xms128m -XX:+UseSerialGC -Dmb.jetty.maxThreads=25 -Dlog4j2.formatMsgNoLookups=true"

# 🔌 Desactivar drivers que no usas (menos memoria)
ENV MB_PLUGINS_DIR=/app/plugins-disabled

EXPOSE 3000
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/metabase.jar"]
