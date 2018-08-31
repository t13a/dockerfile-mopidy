#!/bin/sh

set -euo pipefail

addgroup -g "${PGID}" mopidy
adduser -h "${MOPIDY_HOME}" -g mopidy -s /sbin/nologin -G mopidy -D -u "${PUID}" mopidy

if [ -z "${MOPIDY_NO_INIT:-}" ]
then
    if [ ! -e "${MOPIDY_CACHE_DIR}" ]
    then
        mkdir -p "${MOPIDY_CACHE_DIR}"
        chown mopidy:mopidy "${MOPIDY_CACHE_DIR}"
    fi

    if [ ! -e "${MOPIDY_CONFIG_DIR}" ]
    then
        mkdir -p "${MOPIDY_CONFIG_DIR}"
        chown mopidy:mopidy "${MOPIDY_CONFIG_DIR}"
    fi

    if [ ! -e "${MOPIDY_CONFIG_FILE}" ]
    then
        mkdir -p "$(dirname "${MOPIDY_CONFIG_FILE}")"
        /usr/local/bin/mopidy-default-config > "${MOPIDY_CONFIG_FILE}"
    fi

    if [ ! -e "${MOPIDY_DATA_DIR}" ]
    then
        mkdir -p "${MOPIDY_DATA_DIR}"
        chown mopidy:mopidy "${MOPIDY_DATA_DIR}"
    fi

    if [ ! -e "${MOPIDY_MEDIA_DIR}" ]
    then
        mkdir -p "${MOPIDY_MEDIA_DIR}"
        chown mopidy:mopidy "${MOPIDY_MEDIA_DIR}"
    fi
fi

if [ -z "${MOPIDY_NO_SCAN:-}" ]
then
    mopidy-foreground local scan
fi

exec "${@}"
