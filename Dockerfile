# 1st Docker build stage: build the project with Maven
FROM docker.io/library/maven:3.6.3-openjdk-11 as builder
WORKDIR /project
COPY . /project/
RUN mvn package -DskipTests -B

# 2nd Docker build stage: copy builder output and configure entry point
FROM docker.io/library/adoptopenjdk:11-jre-hotspot
ENV APP_DIR /application
ENV APP_FILE kafka-uber-jar.jar

EXPOSE 8888

WORKDIR $APP_DIR
COPY --from=builder /project/target/*-fat.jar $APP_DIR/$APP_FILE

ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]
