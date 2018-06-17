#!/bin/bash

echo "请输入服务器地址(默认值：10.10.82.12)"
read tmpIp
ip=${tmpIp:="10.10.82.12"}

echo "请输入远程服务器代码路径(默认值：/home/kh/)"
read tmpRemotePath
remotePath=${tmpRemotePath:="/home/kh/"}

echo "请输入本地代码路径(默认：/home/hikwang/www/wlannm-fe/)"
read tmpLocalProjectPath
localProjectPath=${tmpLocalProjectPath:="/home/hikwang/www/wlannm-fe/"}

# 检查当前目录是否是项目目录
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


# 检查是否有修改没有提交 nothing to commit
if [ "$?" -eq 0 ]; then
    res=$(git status)
    commitFlagStr="nothing to commit, working directory clean"

    if [[ "$res" =~ "$commitFlagStr" ]];then
        commitFlag="true"
    else
        echo ${res}
        echo "==================================="
        echo "还有文件没有提交！"
        exit 5
    fi
fi

# 确认全部已提交 删除原有项目文件
if [ "$?" -eq 0 ] && [ "$commitFlag" = "true" ]; then
    rm -rf $localProjectPath*
else
    echo "删除旧文件失败"
    exit 1
fi

# 重新下载新版本项目文件
if [ "$?" -eq 0 ]; then
    rsync -a root@${ip}:${remotePath} $localProjectPath
else
    echo "代码下载失败！"
    exit 2
fi

# 添加到库 `add .`
if [ "$?" -eq 0 ]; then
    git add .
else
    echo "添加到库失败！"
    exit 3
fi

# commit
commitDate=`date "+%F|%H:%M:%S"`
if [ "$?" -eq 0 ]; then
    git commit -m "============"${commitDate}"================"
    exit 0
else
    echo "commit失败！"
    exit 4
fi

# 完成
echo $?
