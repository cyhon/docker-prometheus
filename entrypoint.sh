#!/bin/sh

# https://github.com/prometheus/prometheus/issues/2689
rm -f /prometheus/data/lock
/prometheus/prometheus --config.file=/prometheus/conf/${CONFIG_FILE} \
                       --storage.tsdb.path=/prometheus/data \
                       --web.console.libraries=/prometheus/console_libraries \
                       --web.console.templates=/prometheus/consoles
