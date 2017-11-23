#!/bin/bash

#pull日志到本地
function pullLog(){
    for index in ${arr_num[*]}; do
        # echo $index
        current_time=`date +%H%M%S`
        current_date=`date +%Y%m%d`

        viva_path=/sdcard/Roav/VIVA/
        monkey_path=/sdcard/monkey_log/

        local_path=/home/ocean/Downloads/log/
        local_viva_path=${local_path}"VIVA/${index}/VIVA_"${current_date}_${current_time}
        local_monkey_path=${local_path}"Monkey/"${index}

        adb -s ${index} pull ${viva_path} ${local_viva_path}    #拉取VIVA日志
        adb -s ${index} pull ${monkey_path} ${local_monkey_path}   #拉取monkey日志

        #打开所在路径
        nautilus ${local_path}
    done
}