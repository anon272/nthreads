#!/bin/bash

if [ -n $1 ];
	then
		_pid=$(ps aux | grep -E "$1$" | grep -v grep | grep -v nthreads.sh | awk'{print $2}')
		cat /proc/$_pid/status | grep Threads
fi