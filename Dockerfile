# FROM registry.access.redhat.com/ubi8/openjdk-17:1.14 AS builder
FROM docker.io/maven:3.8.5-openjdk-17 AS builder
# Build dependency offline to streamline build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn package -Dmaven.test.skip=true 
# compute the created jar name and put it in a known location to copy to the next layer.
# If the user changes pom.xml to have a different version, or artifactId, this will find the jar 
RUN mv ./target/*.jar ./target/export-run-artifact.jar

# FROM registry.access.redhat.com/ubi8/openjdk-17-runtime:1.15
FROM docker.io/openjdk:17
COPY --from=builder ./target/export-run-artifact.jar  /deployments/export-run-artifact.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/deployments/export-run-artifact.jar"]