#!/bin/bash

path=/var/www/html/auto-test-shell-script/

. ${path}devices_list.sh
. ${path}install_apk.sh
. ${path}offline_monkey.sh
. ${path}pull_log.sh
. ${path}analysis_log.sh

echo "---------------------------"
echo "1.install current director .apk"
echo "2.exec monkey test"
echo "3.pull_log->/home/user/Android_log"
echo "4.filter current director .log file"
echo "5.display connected mobile list"
echo "(ctrl+d to exit)"
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
            echo "输入错误，请重新输入，或按ctrl+d退出!"
            ;;
    esac

    # read -p "按任意键继续..." var
    # clear
    echo "---------------------------"
    echo "1.install current director .apk"
    echo "2.exec monkey test"
    echo "3.pull_log->/home/user/Android_log"
    echo "4.filter current director .log file"
    echo "5.display connected mobile list"
    echo "(ctrl+d to exit)"
    echo "---------------------------"
done
