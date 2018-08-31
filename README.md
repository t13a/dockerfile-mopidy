# Mopidy

**ABANDONED**. [Mopidy](https://mopidy.com/) is an extensible music server written in Python.

## Images

There are several variants. All images are based on Alpine Linux.

- `t13a/mopidy:base`
    - Mopidy
    - Mopidy-Local-Image
    - Mopidy-Local-SQLite
- `t13a/mopidy:iris` (without Spotify)
    - Mopidy-Iris

## Getting started

```sh
$ docker run --rm \
-p 6600:6600 \
-p 6680:6680 \
-v $(pwd)/media:/mopidy/media \
t13a/mopidy:base
```

## Known issues

- No sound
