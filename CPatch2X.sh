#! /bin/bash
# 创建补丁并上传到目标主机

echo 'COMMIT_ID'
read commitId

echo 'HOST_IP'
read hostIp

patchPath='/home/hikwang/Documents/wifiphp-patch/'
fileName='wifiphp.zip'
zipPath='/home/hikwang/Documents/' 
zipName='wifiphp-patch.zip'

git diff-tree -r --no-commit-id --name-only $commitId | xargs zip -r $patchPath$fileName

if [ $? -eq 0 ];then
    cd $zipPath
    zip -r $zipName 'wifiphp-patch' 
    scp $zipName 'root@'$hostIp':/home/'

    # 上传成功删除补丁
    if [ $? -eq 0 ];then
        rm $patchPath$fileName
        rm $zipPath$zipName
    fi
else
    echo "exit: $? errorMsg: 补丁打包失败";
fi
