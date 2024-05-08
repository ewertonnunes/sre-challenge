FROM openjdk:11-jdk-slim

USER spring:spring

WORKDIR app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]