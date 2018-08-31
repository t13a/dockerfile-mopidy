FROM t13a/mopidy:base

RUN apk add --no-cache \
    sudo && \
    pip install -U \
    Mopidy-Iris && \
    sudo echo "mopidy ALL=NOPASSWD: /usr/local/lib/python2.7/dist-packages/mopidy_iris/system.sh" >> /etc/sudoers
