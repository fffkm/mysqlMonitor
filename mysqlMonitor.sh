#!/bin/bash
LOG_FILE=/var/log/ServerMonitor.log
LOG_DATE=`date '+%Y-%m-%d'`
LOG_TIME=`date '+%H:%M:%S'`
MYSQL_PROCESS=`ps -ef | grep mysqld | grep -v grep | wc -l`
APACHE_PROCESS=`ps -ef | grep httpd | grep -v grep | wc -l`

echo `date '+%Y-%m-%d'` `date '+%H:%M:%S'` START >> $LOG_FILE

if test $MYSQL_PROCESS -eq 0 -o $APACHE_PROCESS -eq 0
then
echo "再起動処理をします。" >> $LOG_FILE
sudo service httpd stop
sudo service mysqld restart
sudo service httpd start
echo "再起動処理が完了しました。" >> $LOG_FILE
fi

echo `date '+%Y-%m-%d'` `date '+%H:%M:%S'` END >> $LOG_FILE
