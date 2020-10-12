# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build


WORKDIR /orders

COPY pom.xml /orders

COPY src /orders/src

run --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package && pwd target && ls target


FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build /orders/target/orders.jar ./app.jar
#WORKDIR /usr/src/app
#RUN	chmod a+rx ./app.jar
RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

ENTRYPOINT ["/usr/bin/java","-jar","./app.jar", "--port=80"]

