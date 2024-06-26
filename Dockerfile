FROM gradle:8-jdk21 as builder
WORKDIR /
COPY . ./



RUN gradle build -x test

FROM openjdk:21-slim
COPY --from=builder build/libs .
ENTRYPOINT ["java","-jar","/todolist_backend-0.0.1-SNAPSHOT.jar"]