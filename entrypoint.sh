#!/bin/sh

/prometheus/prometheus -config.file=/prometheus/conf/${CONFIG_FILE} \
                       -alertmanager.url=${ALERTMANAGER} \
                       -storage.local.path=/prometheus/data \
                       -web.console.libraries=/prometheus/console_libraries \
                       -web.console.templates=/prometheus/consoles
