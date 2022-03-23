FROM alpine:3.15.2

USER root

RUN apk update && \
  apk add curl && \
  apk add netcat-openbsd && \
  apk add busybox-extras
  
ENTRYPOINT ["tail", "-f", "/dev/null"]
