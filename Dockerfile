# 1️⃣ Imagen base liviana de Java
FROM openjdk:17-slim

# 2️⃣ Directorio de trabajo
WORKDIR /app

# 3️⃣ Descargar Metabase .jar oficial
ADD https://downloads.metabase.com/v0.47.6/metabase.jar /app/metabase.jar

# 4️⃣ Exponer puerto de Metabase
EXPOSE 3000

# 5️⃣ Variables de entorno para PostgreSQL
ENV MB_DB_TYPE=postgres
ENV MB_DB_DBNAME=metabase_2yvi
ENV MB_DB_USER=root
ENV MB_DB_PASS=k2KvtFxdqQwOaHx1Jy3atEKoiYZ6VGOu
ENV MB_DB_HOST=dpg-d3gvle8gjchc73a3eun0-a
ENV MB_DB_PORT=5432

# 6️⃣ Comando para iniciar Metabase
CMD ["java", "-jar", "metabase.jar"]
