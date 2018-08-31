FROM python:2.7-alpine

RUN apk add --no-cache \
    gst-plugins-good \
    gst-plugins-ugly \
    py2-gst \
    su-exec && \
    pip install -U \
    Mopidy \
    Mopidy-Local-Images \
    Mopidy-Local-SQLite

COPY /rootfs /

ENV MOPIDY_CACHE_DIR="${MOPIDY_MEDIA_DIR:-/mopidy/cache}" \
    MOPIDY_CONFIG_DIR="${MOPIDY_MEDIA_DIR:-/mopidy/config}" \
    MOPIDY_CONFIG_FILE="${MOPIDY_CONFIG_FILE:-/mopidy.conf}" \
    MOPIDY_DATA_DIR="${MOPIDY_MEDIA_DIR:-/mopidy/data}" \
    MOPIDY_HOME="${MOPIDY_HOME:-/home/mopidy}" \
    MOPIDY_MEDIA_DIR="${MOPIDY_MEDIA_DIR:-/mopidy/media}" \
    PYTHONPATH=/usr/local/lib/python2.7/site-packages:/usr/lib/python2.7/site-packages \
    PUID="${PUID:-1000}" \
    PGID="${PGID:-1000}"

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "mopidy-foreground" ]
