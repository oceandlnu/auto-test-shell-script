#!/bin/bash

#自动安装apk
function installAPK(){
    #echo "请输入一个路径(eg:/home/ocean/Downloads):"
    #read path

    #获取当前路径
    path=`pwd`
    #app包名
    package_name=com.zhixin.roav.viva

    for index in ${arr_num[*]}; do
        # echo $index
        #遍历当前目录下的所有文件和目录
        for file in `ls $path`;do
            file_ext=${file##*.}
            if [ $file_ext = "apk" ]
                then
                echo "${index}开始卸载..."
                adb -s ${index} uninstall ${package_name}
                echo "${index}开始安装..."
                adb -s ${index} install ${path}/${file}
            fi
            # echo $file
        done
    done
}