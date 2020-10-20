# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build
WORKDIR /tmp
copy src /tmp/src
copy pom.xml /tmp/

#run --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package && pwd target && ls target
run mvn clean package 
run chmod a+rx /tmp/target/shipping.jar
from adoptopenjdk/openjdk11:alpine
#WORKDIR /usr/src/app
COPY --from=build /tmp/target/shipping.jar /shipping.jar

#RUN	chmod a+rx ./shipping.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="rayanah" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Shipping" \
  org.label-schema.description="REST API for Shipping service" \
  org.label-schema.url="https://github.com/rayanah/shipping" \
  org.label-schema.vcs-url="github.com:rayanah/shipping.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./shipping.jar", "--port=8080"]

