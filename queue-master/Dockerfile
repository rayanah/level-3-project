# syntax=docker/dockerfile:experimental
FROM maven:3.3-jdk-8 as build

WORKDIR /queue

copy src /queue/src
copy pom.xml /queue/

#RUN --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package
RUN mvn clean package
RUN ls && pwd && ls target
FROM java:openjdk-8-alpine

ENV	SERVICE_USER=myuser \
	SERVICE_UID=10001 \
	SERVICE_GROUP=mygroup \
	SERVICE_GID=10001

RUN	addgroup -g ${SERVICE_GID} ${SERVICE_GROUP} && \
	adduser -g "${SERVICE_NAME} user" -D -H -G ${SERVICE_GROUP} -s /sbin/nologin -u ${SERVICE_UID} ${SERVICE_USER} && \
	apk add --update libcap && \
	mkdir /lib64 && \
	ln -s /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server/libjvm.so /lib/libjvm.so && \
	ln -s /usr/lib/jvm/java-1.8-openjdk/lib/amd64/jli/libjli.so /lib/libjli.so && \
	setcap 'cap_net_bind_service=+ep' $(readlink -f $(which java))

WORKDIR ./queue

COPY --from=build /queue/target/queue-master.jar ./queue-master.jar

#RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./queue-master.jar

USER ${SERVICE_USER}

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./queue-master.jar", "--port=80"]

