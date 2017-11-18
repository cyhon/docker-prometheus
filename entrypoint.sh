#!/bin/sh

/bin/prometheus --config.file=/prometheus/conf/${CONFIG_FILE} \
                --storage.tsdb.path=/prometheus/data \
                --web.console.libraries=/etc/prometheus/console_libraries \
                --web.console.templates=/etc/prometheus/consoles
