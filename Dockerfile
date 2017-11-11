FROM docker.finogeeks.club/base/ubuntu

MAINTAINER "linhaitao@finogeeks.com"
ENV VERSION 2.0.0


RUN export https_proxy=http://10.135.186.25:3128 \
    && apt-get update && apt-get install -y wget \
    && wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz \
    && tar xzf prometheus-${VERSION}.linux-amd64.tar.gz \
    && mv prometheus-${VERSION}.linux-amd64 /prometheus \
    && apt-get purge --auto-remove -y wget \
    && rm -rf /var/lib/apt/lists/* && rm -f prometheus-${VERSION}.linux-amd64.tar.gz

ADD conf /prometheus/conf/
ADD rules /prometheus/rules/
ADD entrypoint.sh /prometheus/entrypoint.sh

ENV CONFIG_FILE "prometheus.yml"

EXPOSE     9090
WORKDIR    /prometheus
ENTRYPOINT [ "/prometheus/entrypoint.sh" ]
