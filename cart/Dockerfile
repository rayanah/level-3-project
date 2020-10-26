FROM maven:3-jdk-8 AS bimage
WORKDIR /cart
COPY . /cart
RUN mvn clean package

FROM weaveworksdemos/msd-java:jre-latest
COPY --from=bimage /cart/target/*.jar ./app.jar
RUN     chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT



LABEL org.label-schema.vendor="rayanah" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Cart" \
  org.label-schema.description="REST API for Cart service" \
  org.label-schema.url="https://github.com/rayanah/level-3-project/carts" \
  org.label-schema.vcs-url="github.com:rayanah/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"]
