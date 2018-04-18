#!/bin/sh
#########################################################################
# Author: (zhangjunhui@domob.cn)
# Created Time: 2018-01-13 02:09:08
# File Name: init.sh
# Description: 
#########################################################################

# ROOT密码
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-"root"}
# 用户DB
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_USER_PASSWORD=${MYSQL_USER_PASSWORD:-""}
MYSQL_USER_DB=${MYSQL_USER_DB:-""}

mkdir -p /run/mysqld/ && chown mysql:mysql /run/mysqld/

# install 基础DB, 用户&权限
mysql_install_db --user=mysql

# 初始化
tfile=`mktemp`
cat << EOF > $tfile
FLUSH PRIVILEGES;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%' IDENTIFIED BY 'mypassword' WITH GRANT OPTION;
EOF

if [ "$MYSQL_DATABASE" != "" ]; then
	echo "[i] Creating database: $MYSQL_DATABASE"
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8;" >> $tfile
	if [ "$MYSQL_USER" != "" ]; then
		echo "[i] Creating user: $MYSQL_USER with password $MYSQL_USER_PASSWORD"
		echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" >> $tfile
	fi
fi


mysqld --user=mysql --bootstrap < $tfile
rm -f $tfile

# 启动
mysqld_safe --user=mysql

# vim: set noexpandtab ts=4 sts=4 sw=4 :
