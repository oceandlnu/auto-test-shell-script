#!/bin/bash

#得到当前多设备序列号serialNumber
function devicesList() {
    #adb devices命令获取list
    devices_num=`adb devices`
    #字符串截取（过滤）
    devices_num=${devices_num#*List of devices attached}
    devices_num=${devices_num#*" "}
    #将设备名过滤出来存到数组，i为数组下标
    i=0

    while [[ ${devices_num} ]]; do
        #表示从右边开始，删除最后（最左边）一个device字符串及右边的字符
        arr_num[$i]=${devices_num%%device*}
        #打印验证是否正确过滤
        echo "设备${i}:${arr_num[$i]}"
        let "i++"
        #表示从左边开始删除第一个device字符串及左边的所有字符
        devices_num=${devices_num#*device}
    done

    echo "---------------------------"
}