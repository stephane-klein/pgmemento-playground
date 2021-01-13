FROM postgres:13.1-alpine

RUN apk add --no-cache make zip \
    && wget -qO - https://github.com/pgMemento/pgMemento/releases/download/v0.7.1/pgmemento-0.7.1.zip | busybox unzip - \
    && cd pgmemento-0.7.1/ \
    && make \
    && make install \
    && cd .. \
    && rm -rf pgmemento-0.7.1/ \
    && apk del make zip
