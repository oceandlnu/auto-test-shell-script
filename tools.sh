#!/bin/bash

path=/var/www/html/auto-test-shell-script/

. ${path}devices_list.sh
. ${path}install_apk.sh
. ${path}offline_monkey.sh
. ${path}pull_log.sh
. ${path}analysis_log.sh

echo "---------------------------"
echo "1-安装当前目录所有apk文件"
echo "2-执行monkey"
echo "3-pull log到本地"
echo "4-分析当前目录log(ANR,Exception)"
echo "5-列出所有设备"
echo "<CTRL+D>退出"
echo "---------------------------"

#初始化设备列表
adb devices>/dev/null

#调用devicesList函数
devicesList

while read sNum
do
    echo "---------------------------"
    case $sNum in
        1 )
            #安装apk
            installAPK
            ;;
        2 )
            #执行monkey
            offlineMonkey
            ;;
        3 )
            #pull log
            pullLog
            ;;
        4 )
            #analysis log
            analysisLog
            ;;
        5 )
            #列出所有设备
            devicesList
            ;;
        * )
            echo "输入错误，请重新输入，或按<CTRL+D>退出!"
            ;;
    esac
    
    read -p "请按任意键继续..." var
    clear
    echo "---------------------------"
    echo "1-安装当前目录所有apk文件"
    echo "2-执行monkey"
    echo "3-pull log到本地"
    echo "4-分析当前目录log(ANR,Exception)"
    echo "5-列出所有设备"
    echo "<CTRL+D>退出"
    echo "---------------------------"
done
