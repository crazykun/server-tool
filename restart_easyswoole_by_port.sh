#!/bin/bash

workDir=`pwd`
port=`cat dev.php| grep 'PORT' | grep   -oe '[0-9]\{1,\}'| head -n 1`

if [ "$#" -eq 0 ]; then
    sudo  php  "${workDir}"/easyswoole server start
fi

if [ "$1" == 'd' ]; then
    sudo  php "${workDir}"/easyswoole server start -d
fi

if [ "$1" == 'stop' ]; then
    sudo lsof -i:"${port}" |awk 'NR == 1 {next} {print $2}' |xargs sudo kill -9
fi