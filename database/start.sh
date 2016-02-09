#!/bin/bash
if ! -f /var/lib/mysql/ibdata1
then
  mysql_install_db
 /usr/bin/mysqld_safe &
  sleep 5
  mysqladmin -u root -h localhost password shroot12
  mysql -uroot -pshroot12 mysql -e " GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'shroot12' WITH GRANT OPTION; FLUSH PRIVILEGES"
  killall mysqld && sleep 5
fi
/usr/bin/mysqld_safe
