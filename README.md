# tools

一些小工具, 常用的shell脚本


### 目录介绍
```
.
├── check_os.sh  系统检测
├── keep_alive.sh  保持在线
├── kill_process_by_name.sh 根据名字杀进程
├── kill_process_by_port.sh 根据端口杀进程
├── service_add.sh 添加服务 (easyswoole 3.3.x)
├── service_add_new.sh 添加服务 (easyswoole 3.4.x)
├── kill_process.sh 清理僵尸进程
├── os_repo_speed_test.sh 国内源速度测试
└── README.md
```

* 使用
```bash
sh service_add.sh
```

>直接下载使用
```bash
yum install -y wget && wget -O service_add.sh https://raw.githubusercontent.com/crazykun/server-tool/master/service_add.sh && sh service_add.sh
````

>easyswoole 3.4.x
```bash
yum install -y wget && wget -O service_add.sh https://raw.githubusercontent.com/crazykun/server-tool/master/service_add_new.sh && sh service_add.sh
````
