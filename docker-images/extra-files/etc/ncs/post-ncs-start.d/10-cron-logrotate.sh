#!/bin/bash

CRON_ENABLE=${CRON_ENABLE:-true}
LOGROTATE_ENABLE=${LOGROTATE_ENABLE:-true}

echo "== Logrotate and cron config variables"
echo "CRON_ENABLE: ${CRON_ENABLE}"
echo "LOGROTATE_ENABLE: ${LOGROTATE_ENABLE}"

if [ ${LOGROTATE_ENABLE} = "true" ] && [ ${CRON_ENABLE} = "false" ]; then
    echo "Logrotate requires cron, please set CRON_ENABLE=true"
    exit 1
fi

if [ ${CRON_ENABLE} = "true" ]; then
    echo "Starting cron"
    cron
fi

if [ ${LOGROTATE_ENABLE} = "false" ]; then
    echo "Removing /etc/logrotate.d/ncs"
    rm /etc/logrotate.d/ncs
fi
