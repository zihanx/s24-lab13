FROM eclipse-temurin:17

RUN mkdir /opt/app
COPY back-end/target/back-end-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/app

RUN mkdir -p /opt/front-end/build
COPY front-end/build /opt/front-end/build

WORKDIR /opt/app

EXPOSE 8080 
CMD ["java", "-jar", "/opt/app/back-end-1.0-SNAPSHOT-jar-with-dependencies.jar"]
