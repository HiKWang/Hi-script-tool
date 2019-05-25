#! /bin/bash
# 创建补丁并上传到目标主机

echo '请输入起始COMMIT_ID'
read beginCommitId

echo '请输入结束COMMIT_ID(默认为HEAD)'
read endId
endCommitId=${endId:='HEAD'}

echo 'PATCH_NAME(默认为patch)'
read name
patchName=${name:='patch'}

echo 'HOST_IP'
read hostIp


createTime=`date "+%F-%H%M"`
patchPath='/home/hikwang/Downloads/tmp/patch/'
fileName=$patchName'_'$createTime'.zip'
zipFile=$patchPath$fileName

# 检查补丁目录是否存在
if [ ! -d "$patchPath" ];then
    mkdir -p "$patchPath"
fi

if [[ $? -eq 0 ]];then
    #git diff-tree -r --no-commit-id --name-only $commitId | xargs zip -r $zipFile
    git diff --name-only $beginCommitId $endCommitId | xargs zip -r $zipFile

    if [ $? -eq 0 ];then
        echo '补丁创建成功:'$zipFile

        if [[ $hostIp -ne null ]];then
            scp $zipFile 'root@'$hostIp':/home/'

            if [ $? -eq 0 ];then
                echo '上传成功：/home/'$fileName
                exit 0
            else
                echo '上传失败！'
                exit 1
            fi
        else
            exit 0
         fi
    else
        echo "补丁创建失败";
        exit 1
    fi
fi

