FROM alpine

RUN apk add openjdk8-jre
WORKDIR /app-exe
COPY target .
COPY enterypoint.sh .
ENTRYPOINT ["enterypoint.sh"]