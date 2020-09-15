#定义变量
WHORK_PATCH=$(cd `dirname $0`;pwd)
LOCAL_IP=`ifconfig ens3 |grep inet| grep netmas|cut -d" " -f10`
ARCH=$(uname -m)
DOCKER_BINARY=/usr/bin/docker
DOCKER_REPO=homeassistant
DOCKER_SERVICE=docker.service
DOCKER_DAEMON_CONFIG=/etc/docker/daemon.json

# 检查环境
command -v systemctl > /dev/null 2>&1 || error "Only systemd is supported!"
command -v docker > /dev/null 2>&1 || error "Please install docker first"
command -v docker-compose > /de/null 2>&1 || error "please install dockerfile"
command -v jq > /dev/null 2>&1 || error "Please install jq first"
command -v curl > /dev/null 2>&1 || error "Please install curl first"
command -v avahi-daemon > /dev/null 2>&1 || error "Please install avahi first"
command -v dbus-daemon > /dev/null 2>&1 || error "Please install dbus first"
command -v nmcli > /dev/null 2>&1 || error "No NetworkManager support on host."
command -v apparmor_parser > /dev/null 2>&1 || error "No AppArmor support on host."
#不要直接退出来，2把结果输出到临时文件中
#询问是否安装（y。n）
#if[y]     then
 #esle[n] then exit1

#添加mqtt用户名以及密码
read -p '为将来的MQTT定义同户名:' MQTT_name
read -p '为将来的MQTT定义密码:' MQTT_passwd
echo YOUT_root :$MQTT_name
echo YOUT_PASSWD :$MQTT_passwd

#sed 's/admin/'$MQTT_name'/g' $WHORK_PATCH/dockerfile/dockerfile-mosqutto/dockerfile
#sed 's/passwd/'$MQTT_passwd'/g' $WHORK_PATCH/dockerfile/dockerfile-mosqutto/dockerfile
#sed 's/admin/$MQTT_passwd/g' ~/config
