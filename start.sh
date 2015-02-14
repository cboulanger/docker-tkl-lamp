#!/bin/bash

[ -z $mariapw ] && mariapw="MariaDBIsGoodForYou!"
service mysql start
sleep 10
mysql -uroot -e "UPDATE user SET password=PASSWORD('$mariapw') WHERE user='root';flush privileges;" mysql
service mysql stop
supervisord -n
