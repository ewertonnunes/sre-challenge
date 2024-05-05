FROM openjdk:22

WORKDIR app

COPY app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]