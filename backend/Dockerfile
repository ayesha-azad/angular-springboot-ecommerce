# Use JDK 17 (LTS) - Most stable for Spring Boot
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml first (for better caching)
COPY pom.xml ./

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use JDK 17 for runtime
FROM openjdk:26-ea-29-jdk-trixie

WORKDIR /app

# Copy the JAR file
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]