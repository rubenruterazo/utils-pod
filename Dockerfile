FROM alpine:3.15.2

USER root

RUN apk update && \
  apk add curl && \
  apk add netcat-openbsd && \
  apk add busybox-extras && \
  apk add openssh && mkdir /.ssh && chmod 777 /.ssh

RUN apk --no-cache add libaio libnsl libc6-compat && \
    cd /tmp && \
    curl -o instantclient-basiclite.zip https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip -SL && \
    unzip instantclient-basiclite.zip && \
    mv instantclient*/ /usr/lib/instantclient && \
    rm instantclient-basiclite.zip && \
    ln -s /usr/lib/instantclient/libclntsh.so.21.1 /usr/lib/libclntsh.so && \
    ln -s /usr/lib/instantclient/libocci.so.21.1 /usr/lib/libocci.so && \
    ln -s /usr/lib/instantclient/libociicus.so /usr/lib/libociicus.so && \
    ln -s /usr/lib/instantclient/libnnz21.so /usr/lib/libnnz21.so && \
    ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 && \
    ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 && \
    ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2

ENV LD_LIBRARY_PATH /usr/lib/instantclient
RUN cd /etc/apk/keys && wget https://raw.githubusercontent.com/jirutka/user-aports/master/.keys/jakub@jirutka.cz-56d0d9fd.rsa.pub && \
    echo https://repo.jirutka.cz/alpine/v3.18/user >> /etc/apk/repositories && apk update && apk add oracle-instantclient-sqlplus
EXPOSE 8080  
ENTRYPOINT ["tail", "-f", "/dev/null"]
