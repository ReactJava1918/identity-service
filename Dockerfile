# Use Eclipse Temurin JDK 17 as the base image
FROM eclipse-temurin:17-jdk

# Expose the application's port
EXPOSE 8080

# Add the JAR file from the build output to the container
ADD target/identity-service.jar identity-service.jar

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "/identity-service.jar"]
