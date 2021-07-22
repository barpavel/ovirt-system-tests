#!/bin/sh

LOG="/var/log/run_dig_loop.log"

total=0
good=0
while true; do
    total=$(expr ${total} + 1)
    dig +tries=1 +time=1 >/dev/null 2>&1 &
    pid=$!
    sleep 2
    wait "${pid}" && good=$(expr ${good} + 1)
    echo "$(date) dig loop: Passed ${good} out of ${total}" >> "${LOG}"
done