#!/bin/bash

#得到当前多设备序列号serialNumber
function devicesList() {
    #adb devices命令获取list
    devices_num=`adb devices`
    #字符串截取（过滤）
    devices_num=`echo "${devices_num}" | sed 's/List of devices attached//g'`
    devices_num=`echo "${devices_num}" | sed 's/\s//g'`
    #将设备名过滤出来存到数组，i为数组下标
    i=0

    for index in ${devices_num}; do
        if [[ `echo "${index}" | grep -c "unauthorized"` == 1 ]]; then
            echo "设备${index%unauthorized*}未允许本机USB调试"
        elif [[ `echo "${index}" | grep -c "nopermissions*"` == 1 ]]; then
            # echo "设备`echo "${index}" | sed 's/nopermissions*//g'`未允许本机调试"
            echo "请将设备\"${index%nopermissions*}\"USB使用方式选择为\"传输文件\""
        elif [[ `echo "${index}" | grep -c "device"` == 1 ]]; then
            arr_num[$i]=`echo "${index}" | sed 's/device//g'`
            device_temp_name=`adb -s ${arr_num[$i]} shell getprop ro.product.model`_`adb -s ${arr_num[$i]} shell getprop ro.build.version.release`
            device_name=`echo "${device_temp_name}" | sed 's/\s//g'`
            echo "${device_name}"
            let "i++"
        else
            echo "设备未开启USB调试选项"
        fi
    done

    echo "---------------------------"
}