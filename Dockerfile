FROM alpine

RUN apk --update add \
  git \
  && mkdir /data \
  && rm -rf /var/cache/apk/*
