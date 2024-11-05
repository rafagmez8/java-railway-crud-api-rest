# Establece imagen a desplegar: java 21
FROM eclipse-temurin:21-jdk as build

# Copia el proyecto al contenedor de docker
COPY . /app
WORKDIR /app

# Cambiar permisos a archivos maven y compilar la aplicación maven (.jar)
RUN chmod +x mvnw
#RUN ./mvnw package -DskipTests
RUN mv -f ./target/*.jar app.jar

# Establece la imagen a ejecutar
FROM eclipse-temurin:21-jre
ARG PORT
# Puerto según el entorno
ENV PORT=${PORT}

# Copia el app.jar a la aplicación compilada
COPY --from=build /app/app.jar .
# Crea un usuario para ejecutar la aplicación
RUN useradd runtime
USER runtime

# Establece el punto de entrada
ENTRYPOINT ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]