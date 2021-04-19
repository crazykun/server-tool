#!/bin/sh
read -p "请输入进程名(例如sw.php): " process_name
if [ ! -n "$process_name" ]; then
  echo "进程名不能为空"
  exit 1
fi

for i in `ps aux|grep ${process_name}|grep -v grep|awk '{print $2}'`;
    do echo stop process $i ...;sudo kill -9 $i; done;
echo "stop ${process_name}.... success!"
