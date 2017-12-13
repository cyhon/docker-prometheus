FROM prom/prometheus:v2.0.0

MAINTAINER "linhaitao@finogeeks.com"

ADD conf /prometheus/conf/
ADD rules /prometheus/rules/
ADD entrypoint.sh /prometheus/entrypoint.sh

ENV CONFIG_FILE "prometheus.yml"

USER root
WORKDIR    /prometheus
ENTRYPOINT [ "/prometheus/entrypoint.sh" ]
