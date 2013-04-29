#!bin/bash

wget -O ~/wp.tgz http://wordpress.org/latest.tar.gz
tar xf ~/wp.tgz
mv ~/wordpress /var/www/$1
rm ~/wp.tgz
chmod -R 775 /var/www/$1
chown -R webuser:www-data /var/www/$1

mysql --user=root --password=dbadmin  -e "create database $2"
cat ~/wp-config.php | sed -e "s/\${db_name}/$2/" -e "s/\${project_name}/$1/" > /var/www/$1/wp-config.php
