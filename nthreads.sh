#!/bin/bash

if [ -z $1 ]; then
    echo -e "You must provide a process name as argument.\nUsage: nthreads <process_name>\n"
    exit 255
fi

nproc=$(ps aux | grep -E "$1$" | grep -v grep | grep -v nthreads.sh)

if [ $? != 0 ]; then
    echo -e "Please provide a valid process name as argument.\nUsage: nthreads <process_name>\n"
    exit 254
else
    _pid=$(echo $nproc | awk '{print $2}')
    cat /proc/$_pid/status | grep Threads
fi