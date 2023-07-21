# Use an official OpenJDK runtime as the base image
FROM openjdk:20

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built by Spring Boot (adjust the jar name if needed)
COPY target/my-employee-0.0.1-SNAPSHOT.jar employees.jar

# Expose the port your Spring Boot app listens on
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "employees.jar"]
