FROM maven:3.5-jdk-8 as BUILD

COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM openjdk:8-jre-alpine
COPY --from=BUILD /usr/src/myapp/target/cucumber-cicd-0.0.1-SNAPSHOT.jar .
CMD ["java","-jar","cucumber-cicd-0.0.1-SNAPSHOT.jar"]
