#!/bin/bash
while true
do
  if [ ! -f /data/wwwroot/udp_server/data/server.pid ] && [  `ps -ef|grep php|grep -v 'grep'|wc -l` -eq 0 ]
      then
         /usr/local/php7112/bin/php /data/wwwroot/udp_server/index.php
  fi
  sleep 20
done
