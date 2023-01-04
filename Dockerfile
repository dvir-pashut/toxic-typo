FROM maven:3.8.6-openjdk-8 AS builder

COPY . /app
WORKDIR /app

RUN mvn verify


FROM alpine

RUN apk add openjdk8-jre
WORKDIR /app-exe
COPY --from=builder /app/target .
ENTRYPOINT java -jar hello-java.jar