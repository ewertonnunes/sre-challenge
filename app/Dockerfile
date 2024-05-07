FROM openjdk:22-jdk-slim

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

WORKDIR app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]