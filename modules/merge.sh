#!/bin/sh
cd $(dirname $0)

docker pull docker.finogeeks.club/tools/yaml-merge
docker run -it --rm -v `pwd`:/app docker.finogeeks.club/tools/yaml-merge yaml_merge -i global.yml mvp.yml business.yml docker.yml infrastructure.yml prober.yml -o finochat.yml
