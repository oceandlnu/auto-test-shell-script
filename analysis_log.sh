#!/bin/bash

function analysisLog(){
    #echo "请输入一个路径(eg:/home/ocean/Downloads):"
    #read pwd_path
    #当前路径
    pwd_path=`pwd`"/"
    echo "Please input keywords(ctrl+d to exit):"
    echo "eg:ANR,CRASH,Exception,GC_FOR_ALLOC,GC_EXPLICIT,GC_CONCURRENT,GC_BEFORE_OOM,Monkey finished,beacon enter"
    while read keywords;
    do
        #遍历当前目录下的所有log文件
        find "${pwd_path}" -type f -name "*.log" | while read line;
        do
            arr[0]=ANR      #无响应
            arr[1]=CRASH        #崩溃
            arr[2]=Exception    #异常
            arr[3]=GC_FOR_ALLOC #因为在分配内存时内存不够引发的
            arr[4]=GC_EXPLICIT  #表明GC被显式请求触发的，如System.gc调用
            arr[5]=GC_CONCURRENT    #表明GC在内存使用率达到一定的警戒值时，自动触发
            arr[6]=GC_BEFORE_OOM    #表明在虚拟机抛出内存丌够异常ＯＯＭ之前，执行最后一次回收内存垃圾
            arr[7]="Monkey finished"    #判断monkey是否执行完成，1表示执行完，0表示执行过程中被终止
            arr[8]="beacon enter"
            echo "-------------------------------"
            echo "文件名:${line}"
            grep -n "${keywords}" "${line}"
        done
        read -p "按任意键继续..." var
        clear
        echo "Please input keywords(ctrl+d to exit):"
        echo "eg:ANR,CRASH,Exception,GC_FOR_ALLOC,GC_EXPLICIT,GC_CONCURRENT,GC_BEFORE_OOM,Monkey finished,beacon enter"

    done
}