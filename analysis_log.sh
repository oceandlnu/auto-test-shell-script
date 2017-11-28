#!/bin/bash

#自动安装apk
function analysisLog(){
    #echo "请输入一个路径(eg:/home/ocean/Downloads):"
    #read pwd_path

	#获取当前路径
	pwd_path=`pwd`

    #遍历当前目录下的所有文件和目录
    for file in `ls ${pwd_path}`;do
    	file_ext=${file##*.}
    	if [ $file_ext = "log" ]
    		then
    		# log_file=`cat ${pwd_path}/${file}`
    		# echo ${log_file}
    		arr[0]=ANR		#无响应
    		arr[1]=CRASH		#崩溃
    		arr[2]=Exception	#异常
    		arr[3]=GC_FOR_ALLOC	#因为在分配内存时内存不够引发的
    		arr[4]=GC_EXPLICIT	#表明GC被显式请求触发的，如System.gc调用
    		arr[5]=GC_CONCURRENT	#表明GC在内存使用率达到一定的警戒值时，自动触发
    		arr[6]=GC_BEFORE_OOM	#表明在虚拟机抛出内存丌够异常ＯＯＭ之前，执行最后一次回收内存垃圾
    		arr[7]=Monkey" "finished	#判断monkey是否执行完成，1表示执行完，0表示执行过程中被终止
    		arr[8]=beacon" "enter
    		#speed lower
    		# echo "Monkey-1:"`awk -v RS="@#$j" '{print gsub(/Monkey/,"&")}' ${pwd_path}/${file}`
    		# echo "Monkey-2:"`awk '{s+=gsub(/Monkey/,"&")}END{print s}' ${pwd_path}/${file}`
    		echo "${file}:"
            echo "---------------------------"
    		for (( i = 0; i < ${#arr[*]}; i++ )); do
    			#statements
    			echo "${arr[$i]}:"`grep -o "${arr[$i]}" ${pwd_path}/${file} |wc -l`
    		done
    		echo "---------------------------"
    	fi
        # echo $file
    done
}