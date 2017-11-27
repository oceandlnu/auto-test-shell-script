#!/bin/bash

path=/var/www/html/auto-test-shell-script/

. ${path}devices_list.sh
. ${path}install_apk.sh
. ${path}pull_log.sh
. ${path}local_monkey.sh
. ${path}offline_monkey.sh
. ${path}analysis_log.sh

echo "---------------------------"
echo "1-安装当前目录apk文件到所有设备"
echo "2-拉取所有设备日志到本地"
echo "3-所有连接设备本地化monkey执行"
echo "4-所有设备离线monkey执行"
echo "5-分析当前目录log(ANR,Exception)"
echo "0-列出所有设备"
echo "<CTRL+D>退出"
echo "---------------------------"

#调用devicesList函数
devicesList

while read sNum
do
    echo "---------------------------"
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
        5 )
            analysisLog
            ;;
        0 )
            #调用devicesList函数
            devicesList
            ;;
        * )
            echo "输入错误，请重新输入，或按<CTRL+D>退出!"
            ;;
    esac
    
    read -p "请按任意键继续..." var
    clear
    echo "---------------------------"
    echo "1-安装当前目录apk文件到所有设备"
    echo "2-拉取所有设备日志到本地"
    echo "3-所有连接设备本地化monkey执行"
    echo "4-所有设备离线monkey执行"
    echo "5-分析当前目录log(ANR,Exception)"
    echo "0-列出所有设备"
    echo "<CTRL+D>退出"
    echo "---------------------------"
done
