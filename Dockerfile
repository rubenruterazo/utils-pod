FROM alpine:3.15.2

RUN apk update && \
  apk add curl && \
  apk add netstat && \
  apk add telnet && \
  apk add netcat
  
ENTRYPOINT ["tail", "-f", "/dev/null"]
