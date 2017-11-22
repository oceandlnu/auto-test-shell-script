#!/bin/bash

path=/home/ocean/Documents/code/sh_code/

. ${path}devices_list.sh
. ${path}install_apk.sh
. ${path}pull_log.sh
. ${path}local_monkey.sh
. ${path}offline_monkey.sh

echo "---------------------------"
echo "1-安装当前目录apk文件到所有设备"
echo "2-拉取所有设备日志到本地"
echo "3-多设备本地化monkey"
echo "4-多设备离线monkey"
echo "<CTRL+D>退出"
echo "---------------------------"

#调用devicesList函数
devicesList

while read sNum
do
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
            echo "输入错误，请重新输入，或按<CTRL+D>退出"
            ;;
    esac
    echo "---------------------------"
    echo "1-安装当前目录apk文件到所有设备"
    echo "2-拉取所有设备日志到本地"
    echo "3-多设备本地化monkey"
    echo "4-多设备离线monkey"
    echo "<CTRL-D> 退出"
    echo "---------------------------"
done

# echo ${arr_num[*]}
