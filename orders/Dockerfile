#FROM weaveworksdemos/msd-java:jre-latest

#WORKDIR /usr/src/app
#COPY *.jar ./app.jar

#RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}

#ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]


FROM maven

COPY . /orders

WORKDIR /orders

RUN mvn clean package && ls 

cmd ["java", "-jar", "target/person-service-1.0.0.jar"]

EXPOSE 80
