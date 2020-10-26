# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build

RUN mkdir -p /shipping
COPY . /shipping
WORKDIR  /shipping

run mvn clean package 


from adoptopenjdk/openjdk11:alpine
COPY --from=build /tmp/target/shipping.jar /app.jar

#RUN	chmod a+rx ./shipping.jar
RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

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

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./shipping.jar", "--port=80"]
