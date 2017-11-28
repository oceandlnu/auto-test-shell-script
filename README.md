## 运行环境：linux + bash

### 使用方式：

将所有文件下载放到一个目录下

更改tools.sh文件的$path路径为你自己tools.sh文件所在的目录

sudo ln -s ${path}tools.sh /usr/bin/tools

然后终端执行tools即可运行该工具

### 主要功能：

1-安装当前目录所有apk文件

2-执行monkey

3-pull log到本地

4-分析当前目录log(ANR,Exception)

5-列出所有设备