FROM develar/java:8u45

MAINTAINER Martin Miklós <miklos.martin@gmail.com>

RUN apk update && \
    apk add wget

ENV HEALTH_VERSION v0.2
ENV TAR_FILE health.jar.tar.gz

RUN wget --no-check-certificate https://github.com/ExpatConnect/health/releases/download/${HEALTH_VERSION}/${TAR_FILE}
RUN tar -xzf $TAR_FILE && rm $TAR_FILE

EXPOSE 8080

CMD ["-jar", "health.jar"]
