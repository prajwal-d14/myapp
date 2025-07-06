FROM openjdk:17

WORKDIR /app

COPY home/ubuntu/myapp/target/myapp-1.0.war /app/myapp.war

ENTRYPOINT ["java", "-jar", "/app/myapp.war"]

EXPOSE 8080
