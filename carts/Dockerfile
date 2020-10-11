#FROM java:openjdk-8-alpine

#WORKDIR /usr/src/app
#COPY ./target/*.jar ./app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"]

FROM maven as build

COPY . /carts

WORKDIR /carts

RUN mvn -DskipTests package && pwd target && ls target

#cmd ["java", "-jar", "target/person-service-1.0.0.jar"]


#FROM weaveworksdemos/msd-java:jre-latest

#WORKDIR /usr/src/app
#COPY --from=build ./orders/target *.jar ./app.jar

#RUN    chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}

#ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
#cmd ["java", "-jar", "target/person-service-1.0.0.jar"]


FROM weaveworksdemos/msd-java:jre-latest

WORKDIR /usr/src/app
COPY --from=build ./carts/target *.jar ./app.jar

RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="Weaveworks" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Cart" \
  org.label-schema.description="REST API for Cart service" \
  org.label-schema.url="https://github.com/microservices-demo/carts" \
  org.label-schema.vcs-url="github.com:microservices-demo/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"


ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
