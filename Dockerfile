FROM alpine

WORKDIR /home/webuser

USER root

RUN apk --update add \
  git \
  bash \
  openssh-client \
  && rm -rf /var/cache/apk/*

COPY run_loop.sh /home/webuser/
# COPY key-for-DataExchange /root/.ssh/id_rsa
COPY my_id_rsa /root/.ssh/id_rsa
COPY config /root/.ssh/config
COPY ./run_loop.sh /run_loop.sh
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/config

ENTRYPOINT ["/run_loop.sh"]

