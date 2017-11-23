#!/bin/bash

#本地化monkey执行脚本
function localMonkey(){
    local_path=/home/ocean/Downloads/log/Monkey/
    for index in ${arr_num[*]}; do
        current_time=`date +%H%M%S` #当前时间
        current_date=`date +%Y-%m-%d`   #当前日期
        monkey_log=monkey_${current_time}.log #monkey.log路径
        #error_log=error_${current_time}.log   #error.log路径

        local_dir=${local_path}${index}/$current_date
        local_file=${local_dir}"/"$monkey_log
        #local_error_file=$local_dir"/"$error_log

        seed=200    #seed的值
        package_name=com.zhixin.roav.viva   #要执行的包名
        param="--hprof --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes"    #设置参数
        sleep_time=500 #等待时间500ms
        excute_num=86400    #执行事件个数，86400*0.5/3600=12小时

        # 判断是否存在文件夹，如果不存在，则创建
        if [ ! -d "$local_dir" ];then
        mkdir -p $local_dir
        fi

        # 执行monkey脚本
        adb -s ${index} shell monkey -s $seed -p $package_name $param -v -v -v --throttle $sleep_time $excute_num > $local_file &

        # 执行完后，打开所在路径
        nautilus $local_path

        # 显示所有优先级大于等于"error"的日志，并且显示日期，调用时间
        # adb logcat *:E time > $local_error_file

        # 强制停止monkey测试
        # adb shell ps | awk '/com\.android\.commands\.monkey/ { system("adb shell kill " $2) }'
    done
}