#!/bin/bash

# 获取CPU占用率等于20%的进程列表
process_list=$(top -b -n 1 | awk '$9 >= 20 {print $0}')

# 判断是否有满足条件的进程
if [ -z "$process_list" ]; then
    echo "No process with CPU usage greater than or equal to 20% found."
else
    # 发送报警信息
    curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=YOUR_KEY' \
    -H 'Content-Type: application/json' \
    -d '{
        "msgtype": "text",
        "text": {
            "content": "The following processes have CPU usage greater than or equal to 20%:\n'$process_list'"
        }
    }'
fi
