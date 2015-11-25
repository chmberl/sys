#!/bin/bash

VERSION=`cat /etc/redhat-release | awk '{print $1$4}'`

if echo $VERSION | grep -i CentOS7* >> /dev/null
then
    echo "OK"
else
    echo "操作系统发行版本不匹配！仅适用于CentOS 7.*"
    exit 1
fi

while getopts :p:m:w:t:s  opt
do
    case "$opt" in
    p) PORT=$OPTARG;;
    m) METHOD=$OPTARG;;
    w) WORKERS=$OPTARG;;
    t) TIMEOUT=$OPTARG;;
    s) PASSWD=$OPTARG;;
    *) echo "$opt is unknown option" && exit;;
    esac
done

read -p "输入密码：" -s passwd
echo

echo $passwd | sudo -S yum install python-setuptools
sudo easy_install pip
sudo pip install shadowsocks

sudo mkdir -p /etc/shadowsocks
echo '{' >> ./config.json
echo '  "server":"0.0.0.0",'  | tee -a ./config.json
echo "  \"server_port\": ${PORT:=8888},"  | tee -a ./config.json
echo '  "local_address": "127.0.0.1",'  | tee -a ./config.json
echo '  "local_port":1080,'   | tee -a ./config.json
echo "  \"password\":\"${PASSWD:=password}\","  | tee -a ./config.json
echo "  \"timeout\":${TIMEOUT:=300},"  | tee -a ./config.json
echo "  \"method\":\"${METHOD:=aes-256-cfb}\"," | tee -a ./config.json
# echo '  "fast_open": true,' | tee -a ./config.json
echo "  \"workers\": ${WORKERS:=1}" | tee -a ./config.json
echo '}'  | tee -a ./config.json

sudo mv ./config.json /etc/shadowsocks/


echo [Unit]>> ./service.txt
echo Description=Shadowsocks Server>> ./service.txt
echo After=network.target>> ./service.txt
echo >> ./service.txt
echo [Service]>> ./service.txt
echo Type=forking>> ./service.txt
echo PIDFile=/run/shadowsocks/server.pid>> ./service.txt
echo PermissionsStartOnly=true>> ./service.txt
echo ExecStartPre=/bin/mkdir -p /run/shadowsocks>> ./service.txt
echo ExecStartPre=/bin/chown root:root /run/shadowsocks>> ./service.txt
echo ExecStart=/usr/bin/ssserver --pid-file /var/run/shadowsocks/server.pid -c /etc/shadowsocks/config.json -d start>> ./service.txt
echo Restart=on-abort>> ./service.txt
echo User=root>> ./service.txt
echo Group=root>> ./service.txt
echo UMask=0027>> ./service.txt
echo>> ./service.txt
echo [Install]>> ./service.txt
echo WantedBy=multi-user.target>> ./service.txt

sudo mv ./service.txt /etc/systemd/system/shadowsocks-server.service

sudo systemctl start shadowsocks-server.service
sudo systemctl enable shadowsocks-server.service

sudo firewall-cmd --permanent --add-port=8888/tcp
sudo firewall-cmd --reload

sudo cp /etc/security/limits.conf ./limits.conf
echo "* soft nofile 51200" >> ./limits.conf
echo "* hard nofile 51200" >> ./limits.conf

sudo mv -b ./limits.conf /etc/security/limits.conf
sudo chmod 644 /etc/security/limits.conf

sudo cp /etc/sysctl.conf >> ./sysctl.conf

echo "# max open files"   >> ./sysctl.conf
echo "fs.file-max = 51200"   >> ./sysctl.conf
echo "# max read buffer"   >> ./sysctl.conf
echo "net.core.rmem_max = 67108864"   >> ./sysctl.conf
echo "# max write buffer"   >> ./sysctl.conf
echo "net.core.wmem_max = 67108864"   >> ./sysctl.conf
echo "# default read buffer"   >> ./sysctl.conf
echo "net.core.rmem_default = 65536"   >> ./sysctl.conf
echo "# default write buffer"   >> ./sysctl.conf
echo "net.core.wmem_default = 65536"   >> ./sysctl.conf
echo "# max processor input queue"   >> ./sysctl.conf
echo "net.core.netdev_max_backlog = 4096"   >> ./sysctl.conf
echo "# max backlog"   >> ./sysctl.conf
echo "net.core.somaxconn = 4096"   >> ./sysctl.conf
echo ""   >> ./sysctl.conf
echo "# resist SYN flood attacks"   >> ./sysctl.conf
echo "net.ipv4.tcp_syncookies = 1"   >> ./sysctl.conf
echo "# reuse timewait sockets when safe"   >> ./sysctl.conf
echo "net.ipv4.tcp_tw_reuse = 1"   >> ./sysctl.conf
echo "# turn off fast timewait sockets recycling"   >> ./sysctl.conf
echo "net.ipv4.tcp_tw_recycle = 0"   >> ./sysctl.conf
echo "# short FIN timeout"   >> ./sysctl.conf
echo "net.ipv4.tcp_fin_timeout = 30"   >> ./sysctl.conf
echo "# short keepalive time"   >> ./sysctl.conf
echo "net.ipv4.tcp_keepalive_time = 1200"   >> ./sysctl.conf
echo "# outbound port range"   >> ./sysctl.conf
echo "net.ipv4.ip_local_port_range = 10000 65000"   >> ./sysctl.conf
echo "# max SYN backlog"   >> ./sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 4096"   >> ./sysctl.conf
echo "# max timewait sockets held by system simultaneously"   >> ./sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets = 5000"   >> ./sysctl.conf
echo "# TCP receive buffer"   >> ./sysctl.conf
echo "net.ipv4.tcp_rmem = 4096 87380 67108864"   >> ./sysctl.conf
echo "# TCP write buffer"   >> ./sysctl.conf
echo "net.ipv4.tcp_wmem = 4096 65536 67108864"   >> ./sysctl.conf
echo "# turn on path MTU discovery"   >> ./sysctl.conf
echo "net.ipv4.tcp_mtu_probing = 1echo"   >> ./sysctl.conf

sudo mv -b ./sysctl.conf /etc/sysctl.conf

sudo chmod 644 /etc/sysctl.conf

