#!/bin/bash

# @Desc: 从远程服务器下载代码以更新本地代码并提交到git
# @Author: kuangheng
# @CreateDate: 2018-11-08 10:52

# 获取服务器地址、代码路径、
# 要更新的代码目录名称(名称以空格隔开 以此转换为list)
echo "请输入服务器地址(默认值：10.10.82.34)"
read tmpIp
ip=${tmpIp:="10.10.82.34"}

echo "请输入远程服务器代码路径(默认值：/home/mpup/mpupdefault/plugins/mpup-web/)"
read tmpRemotePath
remotePath=${tmpRemotePath:="/home/mpup/mpupdefault/plugins/mpup-web/"}

echo "请输入要更新的代码目录名称，名称以空格分隔(默认值：framework project)"
read tmpFileName
fileName=${tmpFileName:="framework project"}

echo "请输入本地代码路径(默认值：/home/hikwang/www/WebMaker/)"
read tmpLocalProjectPath
localProjectPath=${tmpLocalProjectPath:="/home/hikwang/www/WebMaker/"}


# 切换到本地代码目录
curPath=$(pwd)"/"

if [[ "$curPath" =~ "$localProjectPath" ]]; then
    echo "开始下载代码并提交到git..."
else
    echo $curPath
    echo "当前目录不是项目目录"
    echo $localProjectPath
    cd $localProjectPath
    echo "*******************************"
    echo "已切换到项目目录继续执行..."
    echo "*******************************"
fi


# 检查本地代码改动是否全部commit
if [ "$?" -eq 0 ]; then
    res=$(git status)
    commitFlagStr="nothing to commit, working directory clean"

    if [[ "$res" =~ "$commitFlagStr" ]];then
        commitFlag="true"
    else
        echo ${res}
        echo "==================================="
        echo "还有文件没有提交！请检查。"
        exit 1
    fi
fi

# 从远程服务器下载指定目录代码到本地
if [ "$?" -eq 0 ]; then
    for file in $fileName
    do
        sudo rsync -a root@${ip}:${remotePath}${file} $localProjectPath

        if [ "$?" -ne 0 ]; then
            echo "代码下载失败！请重试。"
            exit 2
        fi

    done
fi

# 添加到库 `add .`
if [ "$?" -eq 0 ]; then
    git add .

    if [ "$?" -ne 0 ]; then
        echo "添加到库失败！"
        exit 3
    fi
fi

# commit
commitDate=`date "+%F|%H:%M:%S"`
if [ "$?" -eq 0 ]; then
    git commit -m "============"${commitDate}"================"

    if [ "$?" -ne 0 ]; then
        echo "commit失败！"
        exit 4
    fi
fi

# 完成
echo $?
