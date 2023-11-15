FROM alpine:3.15.2

USER root

RUN apk update && \
  apk add curl && \
  apk add netcat-openbsd && \
  apk add busybox-extras && \
  apk add openssh && mkdir /.ssh && chmod 777 /.ssh

RUN cd /etc/apk/keys && wget https://raw.githubusercontent.com/jirutka/user-aports/master/.keys/jakub@jirutka.cz-56d0d9fd.rsa.pub && \
    echo https://repo.jirutka.cz/alpine/v3.18/user >> /etc/apk/repositories && apk update && apk add oracle-instantclient-sqlplus
EXPOSE 8080  
ENTRYPOINT ["tail", "-f", "/dev/null"]
