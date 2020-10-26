FROM maven:3-jdk-8-slim AS base
RUN mkdir -p /orders
COPY . /orders
WORKDIR  /orders
RUN mvn clean package


FROM adoptopenjdk/openjdk11:alpine

COPY --from=base /orders/target/*.jar ./app.jar

#RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"] 

#ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
