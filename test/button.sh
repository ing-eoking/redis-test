#!/bin/bash

if [ -e "./inf_cmd/pid" ]; then
    PID=`cat ./inf_cmd/pid`
    rm -rf ./inf_cmd/pid
fi

if [ -z "$PID" ] || [ -n "$(ps -p 22252 -o pid=)" ]; then
    nohup perl ./inf_cmd/cmd 127.0.0.1 6379 0<&- &>/dev/null &
    echo "on"
else
    kill -INT $PID
    echo "off"
fi
