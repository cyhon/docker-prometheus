FROM docker.finogeeks.club/base/ubuntu

MAINTAINER "linhaitao@finogeeks.com"
ENV VERSION 1.5.2


RUN export https_proxy=http://10.135.186.25:3128 \
    && apt-get update && apt-get install -y wget \
    && wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz \
    && tar xzf prometheus-${VERSION}.linux-amd64.tar.gz \
    && mv prometheus-${VERSION}.linux-amd64 /prometheus \
    && apt-get purge --auto-remove -y wget \
    && rm -rf /var/lib/apt/lists/* && rm -f prometheus-${VERSION}.linux-amd64.tar.gz \
    && unset https_proxy

EXPOSE     9090
WORKDIR    /prometheus
ENTRYPOINT [ "/prometheus/prometheus" ]
CMD        [ "-config.file=/prometheus/prometheus.yml", \
             "-storage.local.path=/prometheus/data", \
             "-web.console.libraries=/prometheus/console_libraries", \
             "-web.console.templates=/prometheus/consoles" ]
