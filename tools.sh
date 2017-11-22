#!/bin/bash

. /home/ocean/Documents/code/sh_code/devices_list.sh
. /home/ocean/Documents/code/sh_code/install_apk.sh
. /home/ocean/Documents/code/sh_code/pull_log.sh
. /home/ocean/Documents/code/sh_code/local_monkey.sh
. /home/ocean/Documents/code/sh_code/offline_monkey.sh

echo "---------------------------"
echo "1-安装当前目录apk文件到所有设备"
echo "2-拉取所有设备日志到本地"
echo "3-多设备本地化monkey"
echo "4-多设备离线monkey"
echo "---------------------------"

#调用devicesList函数
devicesList

read sNum

case $sNum in
    1 )
        installAPK
        ;;
    2 )
        pullLog
        ;;
    3 )
        localMonkey
        ;;
    4 )
        offlineMonkey
        ;;
    * )
        echo "error"
        ;;
esac

# echo ${arr_num[*]}
