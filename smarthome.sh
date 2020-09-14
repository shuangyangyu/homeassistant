#!/bin/bash
# 设置基本工作路径
WHORK_PATCH=$(cd `dirname $0`;pwd)
#添加mqtt用户名以及密码
read -p '为将来的MQTT定义同户名:' MQTT_name
read -p '为将来的MQTT定义密码:' MQTT_passwd
echo YOUT_root :$MQTT_name
echo YOUT_PASSWD :$MQTT_passwd

#写入配置文件中(缓存中没有完全写入）
sed 's/admin/'$MQTT_name'/g' $WHORK_PATCH/dockerfile/dockerfile-mosqutto/dockerfile
#sed 's/passwd/'$MQTT_passwd'/g' $WHORK_PATCH/dockerfile/dockerfile-mosqutto/dockerfile
#sed 's/admin/$MQTT_passwd/g' ~/config
