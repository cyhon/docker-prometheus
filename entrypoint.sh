#!/bin/sh

# https://github.com/prometheus/prometheus/issues/2689
rm -f /prometheus/data/lock
/bin/prometheus --config.file=/prometheus/conf/${CONFIG_FILE} \
                --storage.tsdb.path=/prometheus/data \
                --web.console.libraries=/etc/prometheus/console_libraries \
                --web.console.templates=/etc/prometheus/consoles
