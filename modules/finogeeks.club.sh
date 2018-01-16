#!/bin/sh
cd $(dirname $0)

docker pull docker.finogeeks.club/tools/yaml-merge
docker run -it --rm -v `pwd`:/app docker.finogeeks.club/tools/yaml-merge yaml_merge -i global.yml staff-homeserver.yml mvp.yml business.yml docker.yml mongodb.yml prober.yml elasticsearch.yml -o finogeeks.club.yml

mv finogeeks.club.yml ../conf/
