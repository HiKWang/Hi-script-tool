#! /bin/bash
# 创建补丁并上传到目标主机

echo 'COMMIT_ID'
read commitId

echo 'HOST_IP'
read hostIp


createTime=`date "+%F-%H-%M"`
patchPath='/home/hikwang/Downloads/tmp/wifiphp-patch/'
fileName='wifiphp_'$createTime'.zip'
zipFile=$patchPath$fileName

# 检查补丁目录是否存在
if [ ! -d "$patchPath" ];then
    mkdir -p "$patchPath"
else
    git diff-tree -r --no-commit-id --name-only $commitId | xargs zip -r $zipFile
fi

if [ $? -eq 0 ];then
    scp $zipFile 'root@'$hostIp':/home/'

    # 上传成功删除补丁
    #if [ $? -eq 0 ];then
        #rm $zipFile
    #fi
else
    echo "exit: $? errorMsg: 补丁打包失败";
fi
