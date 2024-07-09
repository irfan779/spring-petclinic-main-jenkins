# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean install -DskipTests=true

# Stage 2: Build the actual Docker image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built artifact from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port (if your application listens on a specific port)
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
