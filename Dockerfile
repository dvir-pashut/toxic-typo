FROM alpine

RUN apk add openjdk8-jre
WORKDIR /app-exe
COPY target .
ENTRYPOINT ["enterypoint.sh"]