FROM openjdk:8-jre-alpine3.9

WORKDIR /app-exe
COPY target .
#EXPOSE 8080

COPY enterypoint.sh .
ENTRYPOINT ["./enterypoint.sh"]