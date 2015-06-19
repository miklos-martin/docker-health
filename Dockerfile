FROM develar/java:8u45

MAINTAINER Martin Miklós <miklos.martin@gmail.com>

RUN apk update && \
    apk add wget

ENV HEALTH_VERSION 0.4
ENV TAR_FILE health-assembly-${HEALTH_VERSION}.jar.tar.gz

RUN wget --no-check-certificate https://github.com/ExpatConnect/health/releases/download/v${HEALTH_VERSION}/${TAR_FILE}
RUN tar -xzf $TAR_FILE && rm $TAR_FILE && mv health-assembly-${HEALTH_VERSION}.jar health.jar

EXPOSE 8080

CMD ["-jar", "health.jar"]

