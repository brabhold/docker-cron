FROM debian:buster-slim
LABEL maintainer="Yannick Vanhaeren"

RUN set -eux; \
    apt-get update && apt-get install -y cron curl; \
    apt-get clean; \
    rm -r /var/lib/apt/lists/*

ENV TZ "Europe/Brussels"

COPY bin/* /usr/local/bin/

ENTRYPOINT ["docker-entrypoint"]

CMD ["cron", "-f"]
