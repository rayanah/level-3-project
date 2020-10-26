# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-8 as build

WORKDIR /queue

copy src /queue/src
copy pom.xml /queue/

#RUN --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package
RUN mvn clean package
RUN ls && pwd && ls target


FROM adoptopenjdk/openjdk11:alpine

#ENV	SERVICE_USER=myuser \
#	SERVICE_UID=10001 
#	SERVICE_GROUP=mygroup \
#	SERVICE_GID=10001

COPY --from=build /queue/target/*.jar ./queue-master.jar


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./queue-master.jar", "--port=80"]

