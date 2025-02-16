FROM alpine:3.21

ENV LANG=en_US.utf8

ENV NFS_SERVER_DEBUG="0"
# By default allow Docker network
ENV NFS_SERVER_ALLOWED_CLIENTS="172.16.0.0/12"
ENV NFS_SERVER_EXPORT_OPTIONS="rw,sync,root_squash,no_subtree_check,fsid=0,insecure"
ENV NFS_SERVER_NFSD_DEBUG_OPT="-d"
ENV NFS_SERVER_MOUNTD_DEBUG_OPT="-d all"

RUN set -eu && apk add --no-cache nfs-utils

EXPOSE 2049

COPY nfs-server /usr/local/bin
RUN chmod +x /usr/local/bin/nfs-server

ENTRYPOINT ["/usr/local/bin/nfs-server"]