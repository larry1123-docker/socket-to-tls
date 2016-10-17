##
FROM alpine:3.4

MAINTAINER Larry1123 larry1123@larry1123.net

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
# RUN /usr/sbin/groupadd -r socat && /usr/sbin/useradd -r -g socat socat
RUN addgroup socat && adduser -s /bin/bash -D -G socat socat

RUN apk add --no-cache socat

COPY socat-daemon /usr/local/bin/
COPY socat-daemon.conf /opt/socat/

EXPOSE 4433

VOLUME /opt/socat/socket.socket
VOLUME /opt/socat/.ssh/

HEALTHCHECK --timeout=3s CMD socat-daemon status

ENTRYPOINT ['/usr/local/bin/socat-daemon']

CMD socat-deamon start
