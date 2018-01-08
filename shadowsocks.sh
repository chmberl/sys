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
echo '  "fast_open": true,' | tee -a ./config.json
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

# wget –no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh

# chmod +x bbr.sh

# ./bbr.sh