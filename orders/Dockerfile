FROM maven as build

COPY . /orders

WORKDIR /orders

RUN mvn -DskipTests package && pwd target && ls target

FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build ./orders/target *.jar ./app.jar
#WORKDIR /usr/src/app

#RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}

#ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
cmd ["java", "-jar", "target/person-service-1.0.0.jar", "--port=80"]

