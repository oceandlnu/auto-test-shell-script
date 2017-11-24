#!/bin/bash

function mobileMonkey(){
	trap "" HUP	#表明忽略SIGINT信号，按Ctrl+C也不能使脚本退出
	trap "" INT #表明忽略SIGHUP信号，即网络断开时也不能使脚本退出
	current_time=`date +%H%M%S`	#当前时间
	current_date=`date +%Y-%m-%d`	#当前日期
	monkey_log=monkey_$current_time.log	#monkey保存文件名

	mobile_dir=/sdcard/monkey_log/$current_date
	mobile_file=$mobile_dir"/"$monkey_log

	seed=2015	#seed的值
	package_name=com.zhixin.roav.viva	#要执行的包名
	param="--hprof --ignore-crashes --ignore-timeouts --ignore-security-exceptions --ignore-native-crashes --monitor-native-crashes"	#设置参数
	sleep_time=500 #等待时间500ms
	#excute_num=86400	#执行事件个数，86400*0.5/3600=12小时
	excute_num=360000

	# 判断是否存在文件夹，如果不存在，则创建
	if [ ! -d "$mobile_dir" ];then
		mkdir -p $mobile_dir
		# mkdir -m 755 -p $mobile_dir
	fi

	# 执行monkey脚本
	monkey -s ${seed} -p ${package_name} ${param} -v -v -v --throttle $sleep_time ${excute_num}>${mobile_file}

	# 显示所有优先级大于等于"error"的日志，并且显示日期，调用时间
	# adb logcat *:E time > $local_error_file
	# 杀死指定pid的进程
	# adb shell kill pid
	# 强制停止monkey测试
	# adb shell ps | awk '/com\.android\.commands\.monkey/ { system("adb shell kill " $2) }'
}

mobileMonkey