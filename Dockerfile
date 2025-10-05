FROM openjdk:17-slim
WORKDIR /app

ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

ENV JAVA_OPTS="-Xmx256m -Xms128m -XX:+UseSerialGC"

EXPOSE 3000
CMD ["sh", "-c", "java $JAVA_OPTS -jar /app/metabase.jar"]
