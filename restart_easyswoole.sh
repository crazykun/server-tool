#!/bin/sh
pid=`netstat -anp|grep 9501|awk '{printf $7}'|cut -d/ -f1`
if [ -n "$pid" ]; then
    kill -9 ${pid};
    echo "close old service"
fi

php easyswoole server start -mode=produce -d
 echo "start new service"
