ARG SOURCE_TAG=9
FROM ghcr.io/rsturla-cloud/base/almalinux:${SOURCE_TAG}

COPY files/ /
COPY scripts /tmp/scripts

RUN chmod +x /tmp/scripts/*.sh /tmp/scripts/build/*.sh && \
    /tmp/scripts/setup.sh && \
    /tmp/scripts/build.sh && \
    /tmp/scripts/cleanup.sh && \
    rm -rf /tmp/* && \
    bootc container lint

CMD /sbin/init
