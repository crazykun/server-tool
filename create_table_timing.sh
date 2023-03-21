#!/bin/bash

# 设置MySQL连接参数
MYSQL_USER='your_username'
MYSQL_PASSWORD='your_password'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_DATABASE='your_database_name'

# 获取当前日期和时间
CURRENT_DATE=$(date '+%Y-%m-%d')
CURRENT_TIME=$(date '+%H:%M:%S')

# 创建表
TABLE_NAME="my_table_$CURRENT_DATE"
CREATE_TABLE_SQL="CREATE TABLE $TABLE_NAME (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL);"

echo "Creating table $TABLE_NAME at $CURRENT_TIME..."

# 连接MySQL并执行SQL语句
mysql --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --port=$MYSQL_PORT $MYSQL_DATABASE -e "$CREATE_TABLE_SQL"

echo "Table $TABLE_NAME created successfully."
