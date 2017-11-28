#!/bin/bash

#pull日志到本地
function pullLog(){
    for index in ${arr_num[*]}; do
        # echo $index
        current_time=`date +%H%M%S` #当前时间
        current_date=`date +%Y%m%d` #当前日期

        viva_path=/sdcard/Roav/VIVA/    #VIVA log的路径
        monkey_path=/sdcard/monkey_log/ #monkey log的路径

        local_path=/home/ocean/Downloads/log/
        local_viva_path=${local_path}"VIVA/${index}/VIVA_"${current_date}_${current_time}
        local_monkey_path=${local_path}"Monkey/"${index}

        # 判断是否存在文件夹，如果不存在，则创建
        if [ ! -d "${local_viva_path}" ];then
        mkdir -p ${local_viva_path}
        fi

        # 判断是否存在文件夹，如果不存在，则创建
        if [ ! -d "${local_monkey_path}" ];then
        mkdir -p ${local_monkey_path}
        fi

        adb -s ${index} pull ${viva_path} ${local_viva_path}    #拉取VIVA日志
        adb -s ${index} pull ${monkey_path} ${local_monkey_path}   #拉取monkey日志

        #打开所在路径
        #sudo apt-get install nautilus
        # nautilus ${local_path} &
    done
}