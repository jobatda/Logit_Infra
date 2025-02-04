FROM gradle:8.12.1-jdk-21-and-23-alpine

WORKDIR /app

COPY ./Logit_BE .

ENTRYPOINT ["./gradlew", "bootrun"]