#!/bin/bash

# @Name: push2github.sh
# @Desc:自动提交并推送修改到github
# @Author: kuangheng
# @Date: 2018.07.05

# git add commit push
function handleGit(){
    commitFlagStr="nothing to commit, working directory clean"
    res=$(git status)

    # 没有需要提交的文件结果返回1
    if [[ "$res" =~ "$commitFlagStr" ]];then
        return 1
    fi

    git add .

    if [ $? -eq 0 ];then
        git commit -m 'auto push github'
    fi

    if [ $? -eq 0 ];then
        git push origin master
    fi

}
# 需要push的目录 gitDir为数组
gitDir=("/home/hikwang/github/Hi-config-files" "/home/hikwang/github/hikwang.github.io/_posts" "/home/hikwang/github/Hi-script-tool" "/home/hikwang/github/KHSummaries" "/home/hikwang/bin")

# 检查git是否有需要提交的文件
for((i=0; i<${#gitDir[*]}; i++))
do
    # 依次进入相应目录
    cd ${gitDir[$i]}
    if [ $? -eq 0 ];then
        handleGit

        if [ $? -eq 1 ];then
            continue;
        fi
    fi
done