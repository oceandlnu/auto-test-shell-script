#!/bin/bash

#离线执行monkey
function offlineMonkey(){
    for index in ${arr_num[*]}; do
        mobile_path=/sdcard/
        file_name=mobile_monkey.sh
        #将脚本push到手机上
        adb -s ${index} push $file_name ${mobile_path}${file_name}

        #adb shell chmod 777 ${mobile_path}${file_name}
        #执行脚本
        adb -s ${index} shell sh ${mobile_path}${file_name} &
        # adb shell source ${mobile_path}${file_name}

        #也可以分开执行，如下
        #adb shell
        #sh ${mobile_path}${file_name} &

        #当开始执行后，查看是否有sh进程，如果有，拔掉数据线，接着后续的就能够离线运行。
        adb -s ${index} shell ps | grep shell
    done
}