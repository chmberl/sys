#!/bin/bash

# Installing From the Sources

# echo "install pcre 8.37"
# wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.gz
# tar -zxf pcre-8.37.tar.gz
# cd pcre-8.37
# ./configure
# make
# sudo make install

# echo "install zlib"
# wget http://zlib.net/zlib-1.2.8.tar.gz
# tar -zxf zlib-1.2.8.tar.gz
# cd zlib-1.2.8
# ./configure
# make
# sudo make install


# echo "install openssl"
# wget http://www.openssl.org/source/openssl-1.0.2d.tar.gz
# tar -zxf openssl-1.0.2d.tar.gz
# cd openssl-1.0.2d
# ./configure darwin64-x86_64-cc --prefix=/usr
# make
# sudo make install


sudo yum -y install gcc gcc++ autoconf automake
sudo yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel

wget http://nginx.org/download/nginx-1.8.0.tar.gz
tar -zxf nginx-1.8.0.tar.gz
cd nginx-1.8.0
./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-http_spdy_module --with-cc-opt='-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic'
make
sudo make install
