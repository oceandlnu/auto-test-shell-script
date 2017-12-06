#!/bin/bash

#pull日志到本地
function pullLog(){
    for index in ${arr_num[*]}; do
        # echo $index
        current_time=`date +%H%M%S` #当前时间
        current_date=`date +%Y%m%d` #当前日期

        viva_path=/sdcard/Roav/VIVA/    #VIVA log的路径
        monkey_path=/sdcard/monkey_log/ #monkey log的路径

        user_name=`whoami`
        mobile_name=`adb -s ${index} shell getprop ro.product.model`
        # adb -s ${index} shell getprop ro.build.version.release

        #本地日志存放目录
        local_path=/home/${user_name}/Downloads/Android_log/"${mobile_name}/${current_date}_${current_time}"

        # 判断是否存在文件夹，如果不存在，则创建
        if [ ! -d "${local_path}" ];then
            mkdir -p "${local_path}"
        fi

        adb -s ${index} pull ${viva_path} "${local_path}"    #拉取VIVA日志

        adb -s ${index} pull ${monkey_path} "${local_path}"   #拉取monkey日志

        cd "${local_path}"
        #打包为zip压缩包
        zip -r "VIVA.zip" "VIVA"

        #打开所在路径
        if command -v nautilus >/dev/null 2>&1; then
            nautilus "${local_path}" & 
        else
            #如果没有nautilus命令，则先安装
            sudo apt-get install nautilus
            nautilus "${local_path}" &
        fi
        
    done
}