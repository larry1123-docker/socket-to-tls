##
FROM alpine:3.4

MAINTAINER Larry1123 larry1123@larry1123.net

RUN apk add --no-cache socat

RUN groupadd -g 1000 socat && \
    useradd -g socat -u 1000 -r -M socat && \
    mkdir -p /opt/socat /usr/src/socat

COPY socat-daemon /usr/local/bin/
COPY socat-daemon.conf /opt/socat/

EXPOSE 4433

VOLUME /opt/socat/socket.socket
VOLUME /opt/socat/.ssh/

HEALTHCHECK --timeout=3s CMD socat-daemon status

ENTRYPOINT ['socat-deamon']

CMD socat-deamon start
