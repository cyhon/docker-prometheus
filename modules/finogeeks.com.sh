#!/bin/sh
cd $(dirname $0)

docker pull docker.finogeeks.club/tools/yaml-merge
docker run -it --rm -v `pwd`:/app docker.finogeeks.club/tools/yaml-merge yaml_merge -i global.yml homeserver.yml mvp.yml docker.yml mongodb.yml pg-website.yml prober.yml -o finogeeks.com.yml

mv finogeeks.com.yml ../conf/
