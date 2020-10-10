
FROM maven as build

COPY . /orders

WORKDIR /orders

RUN mvn -DskipTests package && ls

cmd ["java", "-jar", "target/person-service-1.0.0.jar"]


FROM weaveworksdemos/msd-java:jre-latest

#WORKDIR /usr/src/app
COPY --from=build home/app/target/order *.j ./app.jar

#RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]


