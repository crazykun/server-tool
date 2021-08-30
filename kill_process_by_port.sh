#!/bin/sh
read -p "请输入端口号(例如9501): " port_name
if [ ! -n "$port_name" ]; then
  echo "端口号不能为空"
  exit 1
fi

pid=`netstat -anp|grep ${port_name}|awk '{printf $7}'|cut -d/ -f1`
kill -9 $pid
echo "stop ${port_name}.... success!"
