#!/bin/sh
echo "#######################################「创建守护进程」##########################################"
read -p "请输入项目名称(英文): " work_name
if [ ! -n "$work_name" ]; then
  echo "项目名不能为空"
  exit 1
fi

#项目路径
work_dir=/data/work/${work_name}
echo "项目路径:${work_dir}"
read -p "请确认创建该服务项目路径(yes/no)? " YES
case $YES in
[yY]|[Yy][Ee][Ss])
    echo "YES"
    ;;
[Nn]|[Nn][Oo])
    read -p "请输入该服务项目路径: " work_dir
    ;;
*)    
    echo "YES"
    ;;
esac

#判定服务是否存在
service_name="/etc/systemd/system/"$work_name".service"
if [ -f  service_name ]; then
    echo "服务已经存在"
    exit 1
fi

#确认
echo "服务名:"${service_name}
read -p "确认创建该服务(yes/no)? " YES
case $YES in
[yY]|[Yy][Ee][Ss])
    echo "YES"
    ;;
[Nn]|[Nn][Oo])
    echo "取消创建"
    exit 2
    ;;
*)    
    ;;
esac



#写入文件
echo "[Unit]
Description=${work_name} Service
After=network.target
After=syslog.target

[Service]
Type=Forking
WorkingDirectory=${work_dir}
ExecStart=/usr/local/php7112/bin/php easyswoole server start -mode=produce -d
ExecStop=/usr/local/php7112/bin/php easyswoole server stop 
ExecRestart=/usr/local/php7112/bin/php easyswoole server restart 
ExecReload=/usr/local/php7112/bin/php easyswoole server reload 
Restart=always

[Install]
WantedBy=multi-user.target graphical.target

"> ${service_name} 

#判定文件是否存在
if [ -f  ${service_name} ]; then
    echo "服务创建成功"
else 
  echo "服务创建失败"
  exit 4
fi

echo "#######################################「重启守护进程」##########################################"
systemctl daemon-reload
systemctl enable "${work_name}.service"
systemctl status "${work_name}.service"
cd ${work_dir}
/usr/local/php7112/bin/php easyswoole server status

