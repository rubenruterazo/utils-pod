FROM alpine:3.15.2

USER root

RUN apk update && \
  apk add curl && \
  apk add netcat-openbsd && \
  apk add busybox-extras && \
  apk add openssh && mkdir /.ssh && chmod 777 /.ssh
EXPOSE 8080  
ENTRYPOINT ["tail", "-f", "/dev/null"]
