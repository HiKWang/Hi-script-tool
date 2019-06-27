#!/bin/sh
# 用于将wlannm.jar下前端要修改的文件解压到指定目录
# @author 匡恒
# @CreateDate 2018-06-12 10:50

unpackPath="/home/kh/"

# 清空 /home/kh
if [ -d $unpackPath ]; then
    rm ${unpackPath}* -rf
else 
    mkdir $unpackPath
fi

# 找到wlannm.jar
wlannmjarFile=$(find "/home/mpup/mpupdefault/plugins/basenm/" -name 'wlannm.jar' -type f)

# 解压
if [ $? -eq 0 -a -f $wlannmjarFile ]; then
    unzip $wlannmjarFile -d $unpackPath
else
    echo "解压wlannm.jar出错"
    exit 2
fi

# 提取相关目录下文件夹
if [ $? -eq 0 ]; then
    mv ${unpackPath}"META-INF/resources/app" $unpackPath
fi

if [ $? -eq 0 ]; then
    mv ${unpackPath}"META-INF/resources/libs" $unpackPath
fi

# 删除多余文件
if [ $? -eq 0 ]; then
comDir=${unpackPath}"com"
metaDir=${unpackPath}"META-INF"
wlannmjar=${unpackPath}"wlannm.jar"

    if [ -d $comDir ]; then
        rm $comDir -rf
    fi

    if [ -f $wlannmjar ]; then
        rm $wlannmjar
    fi

    if [ -d $metaDir ]; then
        rm $metaDir  -rf
    fi
fi

exit $?
