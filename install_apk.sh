#!/bin/bash

#自动安装apk
function installAPK(){
    #echo "请输入一个路径(eg:/home/ocean/Downloads):"
    #read pwd_path

    #获取当前路径
    pwd_path=`pwd`
    #app包名
    # package_name=com.zhixin.roav.viva
    package_name=com.zhixin.roav.charger.viva

    for index in ${arr_num[*]}; do
        #遍历当前目录下的所有文件和目录
        device_temp_name=`adb -s ${index} shell getprop ro.product.model`_`adb -s ${index} shell getprop ro.build.version.release`
        device_name=`echo "${device_temp_name}" | sed 's/\s//g'`
        for file in `ls ${pwd_path}`;do
            file_ext=${file##*.}
            if [ $file_ext = "apk" ]
                then
                echo "${device_name} 开始卸载..."
                adb -s ${index} uninstall ${package_name}
                echo "${device_name} 开始安装..."
                adb -s ${index} install -r ${pwd_path}/${file}
            fi
            # echo $file
        done
    done
}