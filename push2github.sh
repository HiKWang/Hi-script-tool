#!/bin/bash

# @Name: push2github.sh
# @Desc: 自动提交并推送修改到github
# @Author: kuangheng
# @Date: 2018.07.05
# TODO:
#   通过find查找需要提交推送的目录

# git add commit push
function handleGit(){
    commitFlagStr="nothing to commit, working directory clean"
    res=$(git status)

    # 没有需要提交的文件结果返回1
    if [[ "$res" =~ "$commitFlagStr" ]];then
        echo -e "\e[106;91m========= Nothing To Commit =========\e[0m"
        echo -e "\r"
        return 1
    fi

    git pull
    echo -e "\r"

    if [ $? -eq 0 ];then
        git add .
    fi

    if [ $? -eq 0 ];then
        echo -e "\e[4mcommitMsg('auto push github'):\e[0m"
        read commitMsg
        git commit -m "${commitMsg:='auto push github'}"
    fi

    if [ $? -eq 0 ];then
        git push origin master
    fi

    if [ $? -eq 0 ];then
        echo -e "\r"
        echo -e "\e[92m=== End:Push To Complete ===\e[0m"
        echo -e "\r"
    fi

}
# 需要push的目录 gitDir为数组
gitDir=("/home/hikwang/github/Hi-config-files" "/home/hikwang/github/hikwang.github.io/_posts" "/home/hikwang/github/Hi-script-tool" "/home/hikwang/github/KHSummaries" "/home/hikwang/bin" "/home/hikwang/github/FELib" "/home/hikwang/github/Practice-Demo" "/home/hikwang/github/mybasebak")

# 检查git是否有需要提交的文件
for((i=0; i<${#gitDir[*]}; i++))
do
    # 依次进入相应目录
    echo -e "\e[1m=== Start:${gitDir[$i]} ===\e[0m"
    cd ${gitDir[$i]}
    if [ $? -eq 0 ];then
        handleGit

        if [ $? -eq 1 ];then
            continue;
        fi
    fi
done
