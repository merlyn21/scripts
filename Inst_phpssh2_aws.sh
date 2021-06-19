#!/bin/bash

yum install php-devel gcc libgcrypt-devel -y

wget https://www.libssh2.org/download/libssh2-1.9.0.tar.gz -P /tmp

cd /tmp
tar zxvf libssh2-1.9.0.tar.gz
cd libssh2-1.9.0/
./configure
make && make install


wget http://pecl.php.net/get/ssh2-1.3.1.tgz -P /tmp
cd /tmp
tar zxvf ssh2-1.3.1.tgz
cd ssh2-1.3.1/
phpize
./configure
make && make install

echo "extension=ssh2" > /etc/php.d/20-ssh2.ini
systemctl restart php-fpm
