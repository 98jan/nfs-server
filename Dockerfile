FROM alpine:3.21

ENV LANG=en_US.utf8

ENV NFS_SERVER_DEBUG="0"
ENV NFS_SERVER_ALLOWED_CLIENTS="172.16.0.0/12"

RUN set -eu && apk add --no-cache nfs-utils

EXPOSE 2049

COPY nfs-server /usr/local/bin
RUN chmod +x /usr/local/bin/nfs-server

ENTRYPOINT ["/usr/local/bin/nfs-server"]