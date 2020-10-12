# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build

WORKDIR /carts

COPY pom.xml /carts

COPY src /carts/src

run --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package


FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build ./carts/target/carts.jar ./app.jar

#RUN	chmod a+rx ./app.jar
RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar
#doesnt work unless with weaveworksdemos/msd-java:jre-latest


USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="rayanah" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Cart" \
  org.label-schema.description="REST API for Cart service" \
  org.label-schema.url="https://github.com/microservices-demo/carts" \
  org.label-schema.vcs-url="github.com:microservices-demo/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"


ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
